Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D903185207
	for <lists+xen-devel@lfdr.de>; Sat, 14 Mar 2020 00:04:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCtJV-00025B-Lq; Fri, 13 Mar 2020 23:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+q9i=46=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jCtJT-000256-LA
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 23:01:55 +0000
X-Inumbo-ID: a1cb6756-657e-11ea-b3d5-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1cb6756-657e-11ea-b3d5-12813bfff9fa;
 Fri, 13 Mar 2020 23:01:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A88742074C;
 Fri, 13 Mar 2020 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584140514;
 bh=udleyoMhdCSZTTq5hj0I43MZj/VKdkiiIEsWo0nbwbc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Fk0v3Qu3SoKj7OlSZ0lBepMUjIG0aeoxNV5ZUoog9YK+fndhpr/3wTS8joXgfrTfC
 CwCuUH1gS4YXkK8IoL+Fmnz5z0FVY4Ax8q+wsyix47eZLHhpn0P5CcMKZwyeKbIBIJ
 ieB/eicc35u3HdEr4Wxh6IYZt//AbOq8rLexIaL8=
Date: Fri, 13 Mar 2020 16:01:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <ce6e22a2-e9a5-8cf7-b91a-3bd1efe33859@xen.org>
Message-ID: <alpine.DEB.2.21.2003131601280.1269@sstabellini-ThinkPad-T480s>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-2-anthony.perard@citrix.com>
 <4f26f2b9-b011-9533-60ce-05dd6c101827@xen.org>
 <20200311144631.GI2152@perard.uk.xensource.com>
 <ce6e22a2-e9a5-8cf7-b91a-3bd1efe33859@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 1/2] xen/arm: Rename all early printk
 macro
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMiBNYXIgMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDExLzAzLzIwMjAg
MTQ6NDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gT24gV2VkLCBNYXIgMTEsIDIwMjAgYXQg
MDE6NTc6MzdQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBBbnRob255LAo+
ID4gPiAKPiA+ID4gT24gMDkvMDMvMjAyMCAxNzo0NSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4g
PiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9h
cm0vYXJtMzIvaGVhZC5TCj4gPiA+ID4gaW5kZXggZTlkMzU2ZjA1YzJiLi4yYjU5M2M1ZWY5OWEg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+ID4gPiA+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiA+ID4gPiBAQCAtMzYsOCArMzYsOCBAQAo+
ID4gPiA+ICAgICNkZWZpbmUgWEVOX0ZJUlNUX1NMT1QgICAgICBmaXJzdF90YWJsZV9vZmZzZXQo
WEVOX1ZJUlRfU1RBUlQpCj4gPiA+ID4gICAgI2RlZmluZSBYRU5fU0VDT05EX1NMT1QgICAgIHNl
Y29uZF90YWJsZV9vZmZzZXQoWEVOX1ZJUlRfU1RBUlQpCj4gPiA+ID4gLSNpZiAoZGVmaW5lZCAo
Q09ORklHX0VBUkxZX1BSSU5USykpICYmIChkZWZpbmVkIChFQVJMWV9QUklOVEtfSU5DKSkKPiA+
ID4gPiAtI2luY2x1ZGUgRUFSTFlfUFJJTlRLX0lOQwo+ID4gPiA+ICsjaWYgKGRlZmluZWQgKENP
TkZJR19FQVJMWV9QUklOVEspKSAmJiAoZGVmaW5lZAo+ID4gPiA+IChDT05GSUdfRUFSTFlfUFJJ
TlRLX0lOQykpCj4gPiA+IAo+ID4gPiBOSVQ6IEkgd291bGQgYWxzbyB0YWtlIHRoZSBvcHBvcnR1
bml0eSB0byBjbGVhbi11cCB0aGUgbGluZSBieSByZW1vdmUgdGhlCj4gPiA+IGV4dHJhICgpIGFu
ZCB0aGUgc3BhY2UgYmVmb3JlICguIFNvbWV0aGluZyBsaWtlOgo+ID4gPiAKPiA+ID4gI2lmIGRl
ZmluZShDT05GSUdfRUFSTFlfUFJJTlRLKSAmJiBkZWZpbmVkKENPTkZJR19FQVJMWV9QUklOVEtf
SU5DKQo+ID4gPiAKPiA+ID4gWy4uLl0KPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gPiA+ID4g
aW5kZXggZTUwMTVmOTNhMmQ4Li40ZDQ1ZWEzZGFjM2MgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMKPiA+ID4gPiBAQCAtNDUsOCArNDUsOCBAQAo+ID4gPiA+ICAgICNkZWZpbmUgX19IRUFE
X0ZMQUdTICAgICAgICAgICAgKChfX0hFQURfRkxBR19QQUdFX1NJWkUgPDwgMSkgfCBcCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKF9fSEVBRF9GTEFHX1BIWVNf
QkFTRSA8PCAzKSkKPiA+ID4gPiAtI2lmIChkZWZpbmVkIChDT05GSUdfRUFSTFlfUFJJTlRLKSkg
JiYgKGRlZmluZWQgKEVBUkxZX1BSSU5US19JTkMpKQo+ID4gPiA+IC0jaW5jbHVkZSBFQVJMWV9Q
UklOVEtfSU5DCj4gPiA+ID4gKyNpZiAoZGVmaW5lZCAoQ09ORklHX0VBUkxZX1BSSU5USykpICYm
IChkZWZpbmVkCj4gPiA+ID4gKENPTkZJR19FQVJMWV9QUklOVEtfSU5DKSkKPiA+ID4gCj4gPiA+
IFNhbWUgaGVyZS4KPiA+IAo+ID4gVGhvc2UgY2xlYW4tdXAgc291bmRzIGdvb2QuCj4gCj4gSSB3
aWxsIGdpdmUgYSBjb3VwbGUgb2YgZGF5cyBzbyBTdGVmYW5vIGNhbiBoYXZlIGFuIG9wcG9ydHVu
aXR5IHRvIGNvbW1lbnQuIElmCj4gSSBkb24ndCBoZWFyIGFueXRoaW5nIGJ5IE1vbmRheSwgSSB3
aWxsIGNvbW1pdCBpdC4KCkl0J3MgZmluZSBieSBtZS4gQWxzbzoKClRlc3RlZC1ieTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
