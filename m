Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0011058A4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:36:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXqJM-0000Hm-B8; Thu, 21 Nov 2019 17:32:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L+rW=ZN=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iXqJK-0000Hh-Oo
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 17:32:06 +0000
X-Inumbo-ID: d5a4b760-0c84-11ea-b678-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5a4b760-0c84-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 17:32:04 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id s18so1748634qvr.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fn7rb7ddkGt8VwrfYqZOGknFYs84h8zhGVBvE6+pnzM=;
 b=MZFBFzUaSjd4YYhvZb+eFeptDRqJkmsmCOxtQ6q5aLo/q7/wGtv7pII91vVqQ3iURo
 7SGusv4DqoxiPRWEwM0bE2/rCZ+vqJyxXKDKc1IVH2AQayVmCnsQMBUeyBr9I35B6Wmw
 INxUCwGvmyax6x6tWekW5NYmVim2CwBbnbKf6oJNd5ttzNnFMqFNGjHBZgLpOslP2rVK
 5ewCp0K8LPcxQepRtJ3cJzDZeAFJ1Hy3Lzae5Mp3T/65CRttDtgFOKhxdPFDZR0v2Niv
 C5w9omV0qVX0BXM/ru+q7AAIfohUd3ZsBSaV+7OC2UL91AJSP+sinLCzj2zBkE0fxgiQ
 aDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fn7rb7ddkGt8VwrfYqZOGknFYs84h8zhGVBvE6+pnzM=;
 b=bU6bKtmjky+x/vYV4eJvUI7SAnizSQ6HW+gCaDn4k44GQ6aH1sy3rOslVHmJE7OvyA
 cStPJP4LWH8Aeyumb1iWAkDxA5C4IcCMPqoXCzMeXLb/IaNCnQtJ34s2MX/9DiFLVQmv
 q8MtOFq3X/Kt3Q3Fi8a5ZH3LgZsNPjjP7GJaT9x1U5Z2h8xqzVp4Sz+rtoVQeCeF5FTb
 JMlemJtRkKHRL87Dvmrjzze9xXJ7da2swWWyOxE2J2KerofYkA+tyfL7GpELonfqafrS
 JJv1yYRuf5fis2agyxFl5Kr78pQFC4d9HlLiea9NEyfe3YrlwlXu4q3gtMCDFOXJR+/U
 ZnXQ==
X-Gm-Message-State: APjAAAUs84ujDZVr1g0VPcq4TPG8TEWLXyIZDRiwg7IJNKvZ8s6qgJYh
 Yyt3j3G4gfcjZd/XKWcfLYNFc3ls495NHDkayxf7Kw==
X-Google-Smtp-Source: APXvYqyZQHfHhX9La6Wa5af4xbpHaeKAsRkY6+T4PPXDGgcFl0qMH0NJ3yBp3d3rfpwwROhyVF8AZpMs2i57kTk+UpI=
X-Received: by 2002:a0c:9d0d:: with SMTP id m13mr9580556qvf.19.1574357524276; 
 Thu, 21 Nov 2019 09:32:04 -0800 (PST)
MIME-Version: 1.0
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
In-Reply-To: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 21 Nov 2019 09:31:51 -0800
Message-ID: <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTA6MDYgUE0gSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPgo+IFdoZXJlIGRvIHdlIHN0YW5kIHdpdGggWGVuIDQuMTMgcmVnYXJk
aW5nIGJsb2NrZXJzIGFuZCByZWxhdGVkIHBhdGNoZXM/Cj4KPiAxLiBPU1N0ZXN0IGZhaWx1cmUg
cmVnYXJkaW5nIG5lc3RlZCB0ZXN0Ogo+ICAgICBJJ20gbm90IHF1aXRlIHN1cmUgd2hldGhlciB0
aGUgY3VycmVudGx5IGRlYmF0ZWQgcGF0Y2ggb2YgQW5kcmV3IGlzCj4gICAgIGZpeGluZyB0aGUg
cHJvYmxlbS4gSWYgbm90LCBkbyB3ZSBrbm93IHdoYXQgaXMgbWlzc2luZyBvciBob3cgdG8KPiAg
ICAgYWRkcmVzcyB0aGUgaXNzdWU/IElmIHllcywgY291bGQgd2UgcGxlYXNlIGNvbWUgdG8gYW4g
YWdyZWVtZW50Pwo+ICAgICBBcyBhbiBhbHRlcm5hdGl2ZTogYW55IHRob3VnaHRzIGFib3V0IGln
bm9yaW5nIHRoaXMgdGVzdCBmYWlsdXJlIGZvcgo+ICAgICA0LjEzLVJDMyAoSU9XOiBkb2luZyBh
IGZvcmNlIHB1c2gpPwo+Cj4gMi4gUnl6ZW4vUm9tZSBmYWlsdXJlcyB3aXRoIFdpbmRvd3MgZ3Vl
c3RzOgo+ICAgICBXaGF0IGlzIHRoZSBjdXJyZW50bHkgcGxhbm5lZCB3YXkgdG8gYWRkcmVzcyB0
aGUgcHJvYmxlbT8gV2hvIGlzCj4gICAgIHdvcmtpbmcgb24gdGhhdD8KPgo+IDMuIFBlbmRpbmcg
cGF0Y2hlcyBmb3IgNC4xMzoKPiAgICAgQ291bGQgSSBwbGVhc2UgaGF2ZSBmZWVkYmFjayB3aGlj
aCBwYXRjaGVzIHRhZ2dlZCBhcyAiZm9yLTQuMTMiIGFyZQo+ICAgICBmaXhpbmcgcmVhbCByZWdy
ZXNzaW9ucyBvciBpc3N1ZXM/IEkgZG9uJ3Qgd2FudCB0byB0YWtlIGFueSBwYXRjaGVzCj4gICAg
IG5vdCBmaXhpbmcgcmVhbCBwcm9ibGVtcyBhZnRlciBSQzMsIGFuZCBJIGhvcGUgdG8gYmUgYWJs
ZSB0byBnZXQgYQo+ICAgICBwdXNoIHJhdGhlciBzb29uZXIgdGhhbiBsYXRlciB0byBiZSBhYmxl
IHRvIGxldCBJYW4gY3V0IFJDMy4KPgo+IDQuIEFyZSB0aGVyZSBhbnkgYmxvY2tlcnMgZm9yIDQu
MTMgb3RoZXIgdGhhbiAxLiBhbmQgMi4gKGFwYXJ0IG9mIGFueQo+ICAgICBwZW5kaW5nIFhTQXMp
PwoKQW55IGNoYW5jZSB0aGUgZWZpPW5vLXJzIHJlZ3Jlc3Npb24gY2FuIGJlIGFkZGVkIHRvIHRo
ZSBsaXN0PyBJIHVuZGVyc3RhbmQKdGhhdCBJJ20gc3RpbGwgb24gdGhlIGhvb2sgdG8gcHJvdmlk
ZSBtb3JlIGRldGFpbHMgKEkgcHJvbWlzZSB0byBkbyBpdCBvbiBGcmkKd2hlbiBJIGdldCB0byBt
eSBsYWIgdG8gYWN0dWFsbHkgaGF2ZSBhIHNlcmlhbCBjb25zb2xlIG9uIGFsbCB0aGVzZSBib3hl
cykuCkF0IHRoZSBzYW1lIHRpbWUgdGhpcyBpcyBhIHByZXR0eSBzZXJpb3VzIHJlZ3Jlc3Npb24g
Zm9yIGFuIGVudGlyZSBjbGFzcyBvZgpkZXZpY2VzIHdoZXJlIFhlbiB3YXMgcGVyZmVjdGx5IGhh
cHB5IGV2ZW4gZHVyaW5nIFJDMS4KClRoYW5rcywKUm9tYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
