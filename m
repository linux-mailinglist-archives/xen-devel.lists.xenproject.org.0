Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48275CB5D3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:14:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGIhB-0005on-N4; Fri, 04 Oct 2019 08:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qonk=X5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iGIh9-0005oh-Tw
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 08:12:11 +0000
X-Inumbo-ID: a9e98942-e67e-11e9-9745-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9e98942-e67e-11e9-9745-12813bfff9fa;
 Fri, 04 Oct 2019 08:12:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id i16so4781245wmd.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2019 01:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x3e6YU2vE5j59On6YZLUdO0/O+AB6d5VitOCRks7WQQ=;
 b=Fj1sNOuCVlUEyqtV8qvhvf6Nyt9C/DeBt3soXY0vaioHP9TUR8fLURLYWjYzHceGED
 jgkMSf2830ztn04dtNuPfJsidiruwbB2uhBjvkdhFZppoUqGauLHeaPExeImUPdbYum7
 bQkVcvnZvT+TGP4tqIwVABtgiUq/k6HYEawAssIewYRA1bc2qff4DzWnlHG4F4ZMoXDE
 vah3s7vBGyvDQ9YsD3v2HZmemFaPOEJcTPgOaBACNHIXYG+XymJNBcCpB/ilRmGrqpVm
 8mC7/rlFOA9ioDAyGGSLvrse0Bzv1FSGhvPJczaVDmzkVRXXEU0GY03sbCLXA/wvmq+H
 eeEQ==
X-Gm-Message-State: APjAAAU+q1TX3KioO9IXTBT+UJMcJl8J+EK7i2+dg9YsAn8r4wUWdULv
 v5ZlY21y1pUZ7UxOFGjepgE=
X-Google-Smtp-Source: APXvYqwWBErhz8c+PuEEj2XRAGFNlQ/o0slk/8MBBHlH/eJUiCJvj/dUvq8pdkqWEcSwOYdeRAOpXg==
X-Received: by 2002:a1c:a616:: with SMTP id p22mr9700249wme.3.1570176729005;
 Fri, 04 Oct 2019 01:12:09 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id y13sm8184186wrg.8.2019.10.04.01.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 01:12:08 -0700 (PDT)
Date: Fri, 4 Oct 2019 09:12:06 +0100
From: Wei Liu <wl@xen.org>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20191004081206.u7sad6sb4bhfjpwm@debian>
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDQ6MTI6MzBQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBTcGVjaWZpY2FsbHkKPiAqIHhlbi5vcmcgdG8geGVucHJvamVjdC5vcmcKPiAqIGh0dHAg
dG8gaHR0cHMKPiAqIFJlcGxhY2VkIHBhZ2VzIHdoZXJlIHBhZ2UgaGFzIG1vdmVkCj4gICAoaW5j
bHVkaW5nIG9uIHhlbiBwYWdlcyBhcyB3ZWxsIGFzIGV4dGVybmFsIHBhZ2VzKQo+ICogUmVtb3Zl
ZCBzb21lIFVSTHMgKGUuZy4gZG93bmxvYWRzIGZvciBMaW51eCBQViBkcml2ZXJzKQo+IAo+IFRl
c3RlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgoKCj4gLS0tCj4gIGRvY3MvbWFuL3hlbi1wY2ktZGV2aWNlLXJlc2VydmF0
aW9ucy43LnBvZCB8ICAyICstCj4gIGRvY3MvbWFuL3hlbi1wdi1jaGFubmVsLjcucG9kICAgICAg
ICAgICAgICB8ICAyICstCj4gIGRvY3MvbWFuL3hlbi12dHBtLjcucG9kICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGRvY3MvbWFuL3hlbnN0b3JlLWNobW9kLjEucG9kICAgICAgICAgICAg
ICB8ICA0ICsrLS0KPiAgZG9jcy9tYW4veGVuc3RvcmUtbHMuMS5wb2QgICAgICAgICAgICAgICAg
IHwgIDQgKystLQo+ICBkb2NzL21hbi94ZW5zdG9yZS1yZWFkLjEucG9kICAgICAgICAgICAgICAg
fCAgNCArKy0tCj4gIGRvY3MvbWFuL3hlbnN0b3JlLXdyaXRlLjEucG9kICAgICAgICAgICAgICB8
ICA0ICsrLS0KPiAgZG9jcy9tYW4veGVuc3RvcmUuMS5wb2QgICAgICAgICAgICAgICAgICAgIHwg
IDQgKystLQo+ICBkb2NzL21hbi94ZW50b3AuMS5wb2QgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBkb2NzL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QgICAgICAgfCAgNCAr
Ky0tCj4gIGRvY3MvbWFuL3hsLW5ldHdvcmstY29uZmlndXJhdGlvbi41LnBvZCAgICB8ICA4ICsr
KystLS0tCj4gIGRvY3MvbWFuL3hsLW51bWEtcGxhY2VtZW50LjcucG9kICAgICAgICAgICB8ICA0
ICsrLS0KPiAgZG9jcy9tYW4veGwuMS5wb2QuaW4gICAgICAgICAgICAgICAgICAgICAgIHwgMjIg
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAg
ICAgICAgICAgICAgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+ICBkb2NzL21hbi94bC5jb25m
LjUucG9kICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRvY3MvbWFuL3hsY3B1cG9v
bC5jZmcuNS5wb2QgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgMTYgZmlsZXMgY2hhbmdlZCwg
NDcgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3Mv
bWFuL3hlbi1wY2ktZGV2aWNlLXJlc2VydmF0aW9ucy43LnBvZCBiL2RvY3MvbWFuL3hlbi1wY2kt
ZGV2aWNlLXJlc2VydmF0aW9ucy43LnBvZAo+IGluZGV4IDBkZjQxYmNkMjkuLmJjNzM5ODQwOWMg
MTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25zLjcucG9k
Cj4gKysrIGIvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25zLjcucG9kCj4gQEAg
LTI5LDcgKzI5LDcgQEAgbXVsdGlwbGUgWGVuIHZlbmRvcnMgdXNpbmcgY29uZmxpY3RpbmcgSURz
Lgo+ICAKPiAgPWl0ZW0gMy4gVGhlIHZlbmRvciBpcyByZXNwb25zaWJsZSBmb3IgYWxsb2NhdGlv
bnMgd2l0aGluIHRoZSByYW5nZSBhbmQgc2hvdWxkCj4gICAgICAgICAgIHRyeSB0byByZWNvcmQg
c3BlY2lmaWMgZGV2aWNlIElEcyBpbiBQQ0kgSUQgZGF0YWJhc2VzIHN1Y2ggYXMKPiAtICAgICAg
ICAgaHR0cDovL3BjaWlkcy5zb3VyY2Vmb3JnZS5uZXQgYW5kIGh0dHAvL3d3dy5wY2lkYXRhYmFz
ZS5jb20KPiArICAgICAgICAgaHR0cDovL3BjaS1pZHMudWN3LmN6IGFuZCBodHRwczovL2Rldmlj
ZWh1bnQuY29tCgpUaGUgZmlyc3QgY2FuIGJlIGNoYW5nZWQgdG8gdXNlIGh0dHBzIHRvby4gSSBj
YW4gZG8gdGhhdCB3aGVuIEkgY29tbWl0CnRoaXMgcGF0Y2guCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
