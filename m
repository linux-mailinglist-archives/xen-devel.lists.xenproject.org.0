Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE801024DC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 13:51:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX2vk-0007IE-7q; Tue, 19 Nov 2019 12:48:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NUhf=ZL=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iX2vj-0007I9-0U
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 12:48:27 +0000
X-Inumbo-ID: e0a05c02-0aca-11ea-a2fa-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0a05c02-0aca-11ea-a2fa-12813bfff9fa;
 Tue, 19 Nov 2019 12:48:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b3so23661419wrs.13
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 04:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d0UlFfJNHuroLSYTF5+rz3kLYagqf9tliIwwwRCyR3Q=;
 b=Py0yiGHOYbg7sIKChXuFIoOCkM15D5EFsUkHssluI0UNViYcim0ysMW323tovjIm1e
 tb1Zyjc4h0GRv2gl41G+vnSwW5SL1aG/9Nfz7NwFKxGOHLsCpA+YUxS1XnrMd7tSjh1z
 Lgzu/6IhO9ey6LZe8CIejNL4ntdx7JUEmg7/wm+2C05hjjj8TwLdZ33EErqk87TMMD4r
 UxQrRXaW4Pt9G8i+vHYi6NliYZbhdS+7Ci1LyPHcyiON0A90tDGF07MwlYqVgBmnQWTl
 lxEnqvZG6n9ePS0+AP25hS4xkUo8EIbIBKvZ7vf0J2sm2bhN+gJJ5XHa6fU0KPPVSALD
 QErQ==
X-Gm-Message-State: APjAAAVZxNbnw6fhgXLweGxp6ko18t2rbulg7Xdsg7UTTDXsSPUi3cgc
 u1fCDuzD7RDeR64dYKNNfu+RbLr08uo=
X-Google-Smtp-Source: APXvYqwrkpzdiSOUKd0yOuJFI4F33kEmwF3Ph32bha1S0i4pTn5ICer55l0K5jjTEqgzBOBlyDTbsg==
X-Received: by 2002:adf:f985:: with SMTP id f5mr6773025wrr.364.1574167705201; 
 Tue, 19 Nov 2019 04:48:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id d11sm27087992wrn.28.2019.11.19.04.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 04:48:24 -0800 (PST)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
 <76094c14e54b4a0e9ca539797636f060@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <317492a1-f046-8a3b-433a-9ac95e8529dd@xen.org>
Date: Tue, 19 Nov 2019 12:48:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <76094c14e54b4a0e9ca539797636f060@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] arm/vtimer: Physical timer emulation and the
 physical counter
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8xMS8yMDE5IDIyOjMyLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gQ0Mn
aW5nIEp1bGllbidzIG5ldyBlbWFpbCBhZGRyZXNzCgpGb3IgWGVuLWRldmVsLCBJIGhhdmUgZmls
dGVyIHRvIGdldCBpbiBteSBpbmJveCBhbGwgZS1tYWlscyB3aGVyZSBteSAKQGFybS5jb20gaXMg
Q0NlZCA6KS4KCj4gCj4gT24gVGh1cnNkYXksIE5vdmVtYmVyIDE0LCAyMDE5IDI6MzMgUE0sIEpl
ZmYgS3ViYXNjaWsgd3JvdGU6Cj4+IEhlbGxvLAo+Pgo+PiBJJ20gd29ya2luZyBvbiBhIHBvcnQg
b2YgYSBSVE9TIChSVEVNUykgdG8gWGVuIG9uIEFSTSwgYW5kIGNhbWUgYWNyb3NzIGFuCj4+IGlu
dGVyZXN0aW5nIGZpbmRpbmcgaW4gaG93IFhlbiBlbXVsYXRlcyB0aGUgcGh5c2ljYWwgdGltZXIg
b24gQVJNLgo+Pgo+PiBJbiB0ZXN0aW5nIGRpZmZlcmVudCBjb25maWd1cmF0aW9ucyBvZiB0aGUg
cG9ydCwgSSBoYXZlIHRoZSBSVE9TIGNvbmZpZ3VyZWQgdG8KPj4gdXNlIHRoZSBBUk0gZ2VuZXJp
YyBwaHlzaWNhbCB0aW1lci4gVGhlIGRyaXZlciBvcGVyYXRlcyB0aGUgcGh5c2ljYWwgdGltZXIg
aW4KPj4gdGhlICJDb21wYXJlVmlldyIgbW9kZSwgd2hlcmUgdGhlIHRpbWVyIGNvbmRpdGlvbiBp
cyBtZXQgd2hlbiB0aGUgcGh5c2ljYWwKPj4gY291bnRlciByZWFjaGVzIHRoZSBwcm9ncmFtbWVk
IENvbXBhcmVWYWx1ZS4KPj4KPj4gVGhlIGRyaXZlciBpbml0aWFsaXplcyB0aGUgcGh5c2ljYWwg
dGltZXIgYnkgZmlyc3QgcmVhZGluZyB0aGUgcGh5c2ljYWwgY291bnRlcgo+PiByZWdpc3RlciBD
TlRQQ1QsIGFkZGluZyB0aGUgc3lzdGljayBpbnRlcnZhbCwgYW5kIHRoZW4gd3JpdGluZyB0aGUg
cmVzdWx0IHRvIHRoZQo+PiBDb21wYXJlVmFsdWUgcmVnaXN0ZXIgQ05UUF9DVkFMLiBUaGlzIGFw
cGVhcnMgdG8gYmUgdmFsaWQgYmVoYXZpb3IgYmFzZWQgb24gbXkKPj4gdW5kZXJzdGFuZGluZyBv
ZiB0aGUgQVJNVjggQXJjaGl0ZWN0dXJlIFJlZmVyZW5jZSBNYW51YWwsIHNpbmNlIHRoZSBwaHlz
aWNhbAo+PiB0aW1lciAib2Zmc2V0IiBpcyBzcGVjaWZpZWQgdG8gYmUgemVyby4KPj4KPj4gWGVu
IHdpbGwgdHJhcCBhY2Nlc3NlcyB0byB0aGUgcGh5c2ljYWwgdGltZXIgcmVnaXN0ZXJzIC0gQ05U
UF9DVEwsIENOVFBfQ1ZBTCwKPj4gYW5kIENOVFBfVFZBTCwgd2hpY2ggaGFwcGVucyBpbiB4ZW4v
YXJjaC9hcm0vdnRpbWVyLmMuIFhlbiB3aWxsIGFkZCBvciByZW1vdmUgYW4KPj4gb2Zmc2V0IHBo
eXNfdGltZXJfYmFzZS5vZmZzZXQgd2hlbiByZWFkaW5nIG9yIHdyaXRpbmcgdG8gdGhlIENOVFBf
Q1ZBTC9DTlRQX1RWQUwKPj4gcmVnaXN0ZXJzLiBUaGlzIG9mZnNldCBpcyBkZXRlcm1pbmVkIHdo
ZW4gdGhlIHZ0aW1lciBpcyBpbml0aWFsaXplZCBvbiBndWVzdAo+PiBjcmVhdGlvbi4KPj4KPj4g
SG93ZXZlciwgWGVuIGRvZXMgbm90IHRyYXAgYWNjZXNzIHRvIHRoZSBwaHlzaWNhbCBjb3VudGVy
IHJlZ2lzdGVyIENOVFBDVC4gVGhpcwo+PiBtZWFucyB0aGUgZ3Vlc3QgaGFzIGRpcmVjdCBhY2Nl
c3MgdG8gdGhlIHJlZ2lzdGVyLiBJdCBhbHNvIG1lYW5zIHRoZSBvZmZzZXQgaXMKPj4gbm90IGFw
cGxpZWQgaGVyZS4gSSBiZWxpZXZlIHRoaXMgaXMgYSBwcm9ibGVtLCBiZWNhdXNlIHRoZSBwaHlz
aWNhbCB0aW1lciBpcyBubwo+PiBsb25nZXIgY29uc2lzdGVudCB3aXRoIHRoZSBwaHlzaWNhbCBj
b3VudGVyIGZyb20gdGhlIGd1ZXN0J3MgcGVyc3BlY3RpdmUgLSB0aGVyZQo+PiBpcyBhIG5vbi16
ZXJvLCB1bmtub3duIG9mZnNldCBiZXR3ZWVuIHRoZSB0d28uCj4+Cj4+IFRoaXMgd2FzIGEgcHJv
YmxlbSBmb3IgdGhlIFJUT1MsIHNpbmNlIGl0IHdhcyByZWFkaW5nIHRoZSBwaHlzaWNhbCBjb3Vu
dGVyCj4+IHJlZ2lzdGVyIChYZW4gZG9lcyBub3QgYXBwbHkgYW4gb2Zmc2V0KSwgYWRkaW5nIHNv
bWUgaW50ZXJ2YWwsIGFuZCB0aGVuIHNldHRpbmcKPj4gdGhlIENvbXBhcmVWYWx1ZSByZWdpc3Rl
ciAoWGVuIGFwcGxpZXMgdGhlIG9mZnNldCksIHJlc3VsdGluZyBpbiBhIGxvbmcgZGVsYXkKPj4g
YmVmb3JlIHRoZSB0aW1lciBleHBpcmVzLgoKVGhlIGRlc2NyaXB0aW9uIG1ha2VzIHNlbnNlLgoK
Pj4KPj4gSSB3YXMgYWJsZSB0byBmaXggdGhpcyBieSBhZGRpbmcgY29kZSBpbiBYZW4gdG8gdHJh
cCBhY2Nlc3MgdG8gQ05UUENUIGFuZAo+PiBhcHBseWluZyB0aGUgb2Zmc2V0IC0gSSBjYW4gc3Vi
bWl0IHRoZSBwYXRjaCBpZiB0aGVyZSBpcyBpbnRlcmVzdC4gSG93ZXZlciwgSQo+PiB3YXMgY3Vy
aW91cyBpZiB0aGVyZSB3YXMgYW4gcmVhc29uIGZvciBub3QgdHJhcHBpbmcvIGVtdWxhdGluZyBh
Y2Nlc3MgdG8gdGhlCj4+IHBoeXNpY2FsIGNvdW50ZXIgcmVnaXN0ZXIgYW5kIGFwcGx5aW5nIHRo
ZSBvZmZzZXQ/CgpUaGlzIGlzIGRlZmluaXRlbHkgYSBidWcgaW4gdGhlIGVtdWxhdGlvbi4gQnV0
IEkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2UgCmFjdHVhbGx5IHdhbnQgdG8gdHJhcCB0aGUgcGh5
c2ljYWwgY291bnRlciByZWdpc3RlciBhcyB0aGlzIGhhcyBhIGNvc3QuCgpUaGUgb25seSByZWFz
b25zIHRvIHRyYXAgcGh5c2ljYWwgdGltZXIgcmVnaXN0ZXJzIGlzIHRvIGVuc3VyZSB0aGUgCmNv
dW50ZXIgc3RhcnRzIGF0IDAgZm9yIHRoZSBndWVzdC4gSSBhbSBub3QgZW50aXJlbHkgY29udmlu
Y2VkIHRoaXMgaXMgCnVzZWZ1bCBhcyB3ZSBkb24nIHQgeWV0IHN1cHBvcnQgbWlncmF0aW9uLiBF
dmVuIHdpdGggbWlncmF0aW9uLCB3ZSBtYXkgCndhbnQgdG8gbm90IHRyYXAgdGhlIHJlZ2lzdGVy
cyB1bnRpbCB0aGUgZ3Vlc3QgaGFzIGJlZW4gbWlncmF0ZWQgdG8gc2F2ZSAKY29zdC4KCkJ1dCwg
dGhlIHRpbWVyIGNvZGUgbG9va3MgYSBiaXQgZmlzaHksIHRoZSBoeXBlcnZpc29yIHNob3VsZCB1
c2UgdGhlIApoeXBlcnZpc29yIHRpbWVyIGJ1dCB3ZSBzZWVtIHRvIGhhdmUgY29kZSB0byBoYW5k
bGUgdGhlIGludGVycnVwdCBmb3IgCnRoZSBwaHlzaWNhbCB0aW1lciAoc2VlIGFyY2gvYXJtL3Rp
bWUuYykgYnV0IG5vdCBjb25maWd1cmUgaXQuIExvb2tpbmcgCmF0IHRoZSBsb2csIHRoaXMgc2Vl
bXMgdG8gYmUgYSBsZWZ0LW92ZXIgZnJvbSBlYXJseSBYZW4gdGhhdCB3YXMgbm90IApyZW1vdmVk
IGJ5IDZjNzZjYjhjYjUgInhlbi9hcm06IFNvbWUgY2xlYW4gdXAgaW4gdGltZS5jIi4KClNvIEkg
dGhpbmsgd2UgY2FuIGhhbmRsZSB0aGUgcGh5c2ljYWwgdGltZXIgaW4gc2ltaWxhciBmYXNoaW9u
IHRvIHRoZSAKdmlydHVhbCB0aW1lci4gVGhpcyBzaG91bGQgbGlrZWx5IGltcHJvdmUgcGVyZm9y
bWFuY2UgZm9yIE9TIHN0aWxsIHVzaW5nIAp0aGUgcGh5c2NpYWwgdGltZXIgKEFGQUlLIGxpbnV4
IGFybTY0IHdpbGwgdXNlIHRoZSB2aXJ0IHRpbWVyIGJ5IGRlZmF1bHQpLgoKQEplZmYsIHdvdWxk
IHlvdSBtaW5kIHRvIGhhdmUgYSBsb29rIGF0IGl0PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
