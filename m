Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106EE187C2A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 10:39:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE8e4-0004vE-QD; Tue, 17 Mar 2020 09:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Yf1=5C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jE8e3-0004v9-Ir
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 09:36:19 +0000
X-Inumbo-ID: c0fcf462-6832-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0fcf462-6832-11ea-b34e-bc764e2007e4;
 Tue, 17 Mar 2020 09:36:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b18so20926660edu.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 02:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rvULPermO+4e0ZKzn81A5I+A77+ruQxtzm6nw84JRD0=;
 b=VUR9yVewptue7syK+NjMpBAAeaeVbBMoZ2IqBQNuAxk0KVz8CPm/0sIEoEL+9ngW4m
 o+3VsY4cYKEn8MV/u6R8YnncpNly3nhFgpafJy6YQvvVnsAoDX8n6WONgGsEoVPaKzfj
 YuLC9kcHvugYEKmZLUJYno93xuUecO+n+wFXjzgnSpX9RVdJ1M7kGmYZRFHBeFFrH8Lz
 KVXEVOKFV1OcUa8W8SrCROA1JuZx1eurHcM9ubhMv6RlmBeASi/YaWnMbHiCWAtbW6jI
 NQWoWGW8zJ7HJUm/rC/iAlspfFG9/1jNLH1pNUjq44LyOZbCrQbmpgSBBRSt+gqpX9UK
 Q2ug==
X-Gm-Message-State: ANhLgQ0ZXlKTjIgW+OwnVokg7TDUBKIWGqEsSDa9XQsHWIGUsx8ESjEj
 gRq1xNW+YMa56QVUjHaoIfU=
X-Google-Smtp-Source: ADFU+vvGo0Wnq5c0tgqIJfTVHchr8mZdgA2Fn3EOVXB7j+bjjUSRBKqbiWcMqW9G6AUSH4d1D6V5WA==
X-Received: by 2002:aa7:d042:: with SMTP id n2mr4272998edo.88.1584437777931;
 Tue, 17 Mar 2020 02:36:17 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id t13sm155357edw.49.2020.03.17.02.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 02:36:16 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <alpine.DEB.2.21.2003131605490.1269@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2003131614160.1269@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <72604419-b3a1-3c14-c937-07d9ec7fd62b@xen.org>
Date: Tue, 17 Mar 2020 09:36:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003131614160.1269@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMy8wMy8yMDIwIDIzOjE0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
RnJpLCAxMyBNYXIgMjAyMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBNb24sIDkg
TWFyIDIwMjAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gQXQgdGhlIG1vbWVudCwgZWFybHkg
cHJpbnRrIGNhbiBvbmx5IGJlIGNvbmZpZ3VyZWQgb24gdGhlIG1ha2UgY29tbWFuZAo+Pj4gbGlu
ZS4gSXQgaXMgbm90IHZlcnkgaGFuZHkgYmVjYXVzZSBhIHVzZXIgaGFzIHRvIHJlbW92ZSB0aGUg
b3B0aW9uCj4+PiBldmVyeXRpbWUgaXQgaXMgdXNpbmcgYW5vdGhlciBjb21tYW5kIG90aGVyIHRo
YW4gY29tcGlsaW5nIHRoZQo+Pj4gaHlwZXJ2aXNvci4KPj4+Cj4+PiBGdXJ0aGVybW9yZSwgZWFy
bHkgcHJpbnRrIGlzIG9uZSBvZiB0aGUgZmV3IG9kZHMgb25lIHRoYXQgYXJlIG5vdAo+Pj4gdXNp
bmcgS2NvbmZpZy4KPj4+Cj4+PiBTbyB0aGlzIGlzIGFib3V0IHRpbWUgdG8gbW92ZSBpdCB0byBL
Y29uZmlnLgo+Pj4KPj4+IFRoZSBuZXcga2NvbmZpZ3Mgb3B0aW9ucyBhbGxvdyBhIHVzZXIgdG8g
ZWF0aGVyIHNlbGVjdCBhIFVBUlQgZHJpdmVyCj4+PiB0byB1c2UgYXQgYm9vdCB0aW1lLCBhbmQg
c2V0IHRoZSBwYXJhbWV0ZXJzLCBvciBpdCBpcyBzdGlsbCBwb3NzaWJsZQo+Pj4gdG8gc2VsZWN0
IGEgcGxhdGZvcm0gd2hpY2ggd2lsbCBzZXQgdGhlIHBhcmFtZXRlcnMuCj4+Pgo+Pj4gSWYgQ09O
RklHX0VBUkxZX1BSSU5USyBpcyBwcmVzZW50IGluIHRoZSBlbnZpcm9ubWVudCBvciBvbiB0aGUg
bWFrZQo+Pj4gY29tbWFuZCBsaW5lLCBtYWtlIHdpbGwgcmV0dXJuIGFuIGVycm9yLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
Pj4+Cj4+PiAtLS0KPj4+Cj4+PiBPcmlnaW5hbCBwYXRjaDoKPj4+ICAgICAgW1BBVENIIGZvci00
LjEzXSB4ZW4vYXJtOiBBZGQgU2tlbGV0b24gZm9yIHVzaW5nIGNvbmZpZ3VyaW5nIGVhcmx5IHBy
aW50ayB1c2luZyBLY29uZmlnCj4+PiAgICAgIDwyMDE5MDkxMzEwMzk1My44MTgyLTEtanVsaWVu
LmdyYWxsQGFybS5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBOb3RlczoKPj4+ICAgICAgdjM6Cj4+PiAg
ICAgIC0gcmVuYW1lIEVBUkxZX1BSSU5LIHRvIENPTkZJR19FQVJMWV9QUklOVEsgaW4gbWFrZWZp
bGUgaGVyZSAod2hpY2gKPj4+ICAgICAgICBzZWxlY3Qgd2hpY2ggb2JqZWN0IHRvIGJ1aWxkKS4K
Pj4+ICAgICAgLSByZW5hbWUgRUFSTFlfVUFSVF9CQVVEX1JBVEUgdG8gRUFSTFlfVUFSVF9QTDAx
MV9CQVVEX1JBVEUKPj4+ICAgICAgLSB0eXBvcwo+Pj4gICAgICAtIGRyb3AgdGhlIGxpc3Qgb2Yg
YWxpYXNlcyBpbiBlYXJseS1wcmludGsudHh0LiBLY29uZmlnIGNob2ljZSBtZW51Cj4+PiAgICAg
ICAgc2hvdWxkIGJlIGVub3VnaC4KPj4+ICAgICAgLSByZXdvcmQgZWFybHktcHJpbnRrLnR4dC4K
Pj4+ICAgICAgLSByZXdvcmsgaG93IEVBUkxZX1BSSU5USyBpcyBzZXQgdG8gWQo+Pj4gICAgICAg
IGFuZCB1c2UgdGhhdCBpbnN0ZWFkIG9mIGEgbGlzdCBvZiBhbGwgRUFSTFlfVUFSVF8qCj4+PiAg
ICAgIC0gQWRkIGEgY2hlY2sgdG8gYXNrIHVzZXIgdG8gdXNlIEtjb25maWcgdG8gc2V0IGVhcmx5
IHByaW50ay4KPj4+ICAgICAgLSByZXdvcmsgdGhlIHBvc3NpYmxlIGNob2ljZSB0byBoYXZlIGFs
bCB1YXJ0IGRyaXZlciBhbmQgcGxhdGZvcm0KPj4+ICAgICAgICBzcGVjaWZpYyBvcHRpb24gdG9n
ZXRoZXIuCj4+PiAgICAgIC0gaGF2ZSBhZGRlZCBvciByZXdvcmQgcHJvbXB0IGFuZCBoZWxwIG1l
c3NhZ2VzIG9mIHRoZSBkaWZmZXJlbnQKPj4+ICAgICAgICBvcHRpb25zLiBUaGUgcGxhdGZvcm0g
c3BlY2lmaWMgb3B0aW9uIGRvbid0IGhhdmUgZXh0ZW5kZWQgaGVscCwgdGhlCj4+PiAgICAgICAg
cHJvbXB0IGlzIHByb2JhYmx5IGVub3VnaC4KPj4+ICAgICAgICAoVGhlIG5vbi1wbGF0Zm9ybSBz
cGVjaWZpYyBvcHRpb25zIGhhdmUgdGhlIGhlbHAgbWVzc2FnZSB0aGF0IEp1bGllbgo+Pj4gICAg
ICAgIGhhdmUgd3JpdHRlbiBpbiB0aGUgZmlyc3QgdmVyc2lvbi4pCj4+PiAgICAgIC0gaGF2ZSBt
YWRlIEVBUkxZX1VBUlRfSU5JVCBkZXBlbmRlbnQgb24gdGhlIHZhbHVlIG9mCj4+PiAgICAgICAg
RUFSTFlfVUFSVF9QTDAxMV9CQVVEX1JBVEUgc28gdGhhdCB0aGVyZSBpcyBubyBuZWVkIHRvIGV4
cG9zZSBfSU5JVCB0bwo+Pj4gICAgICAgIHVzZXJzLgo+Pj4KPj4KPj4gVGhlIHBhdGNoIGlzIGZp
bmUgYnkgbWUuIEkgb25seSBoYXZlIG9uZSB2ZXJ5IG1pbm9yIGNvbW1lbnQgYmVsb3cuCj4gCj4g
SSBmb3Jnb3QgdG8gYWRkCj4gCj4gVGVzdGVkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CgpUaGFuayB5b3UgZm9yIHRoZSB0ZXN0aW5nLiBUaGlzIHBhdGNo
IGNvbnRhaW5zIGEgcXVlc3Rpb24gZm9yIHlvdSAoc2VlIApbMV0pLiBDYW4geW91IHBsZWFzZSB0
YWtlIGEgbG9vaz8KCkNoZWVycywKClsxXSA8NzcyMGY1NGUtN2VmNy05ZGFlLWRmZGItMzhiODlh
MDg5MmE2QHhlbi5vcmc+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
