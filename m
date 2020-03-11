Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B611814CE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:28:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxdJ-0004xR-CN; Wed, 11 Mar 2020 09:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBxdH-0004xK-Fm
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:26:31 +0000
X-Inumbo-ID: 640f8902-637a-11ea-af48-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 640f8902-637a-11ea-af48-12813bfff9fa;
 Wed, 11 Mar 2020 09:26:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7523AB3D;
 Wed, 11 Mar 2020 09:26:29 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-14-anthony.perard@citrix.com>
 <ba5b75bf-acb0-5ff4-cd79-a96b6ae86c09@suse.com>
 <20200310171022.GE2152@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1947dc76-ab6f-fbc7-fa07-12213e9706ad@suse.com>
Date: Wed, 11 Mar 2020 10:26:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310171022.GE2152@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 13/23] xen/build: include
 include/config/auto.conf in main Makefile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxODoxMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gV2VkLCBNYXIg
MDQsIDIwMjAgYXQgMDM6Mjk6NTVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2
LjAyLjIwMjAgMTI6MzMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gKyMgVGhlIGFjdHVhbCBj
b25maWd1cmF0aW9uIGZpbGVzIHVzZWQgZHVyaW5nIHRoZSBidWlsZCBhcmUgc3RvcmVkIGluCj4+
PiArIyBpbmNsdWRlL2dlbmVyYXRlZC8gYW5kIGluY2x1ZGUvY29uZmlnLy4gVXBkYXRlIHRoZW0g
aWYgLmNvbmZpZyBpcyBuZXdlciB0aGFuCj4+PiArIyBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYg
KHdoaWNoIG1pcnJvcnMgLmNvbmZpZykuCj4+PiArIwo+Pj4gKyMgVGhpcyBleHBsb2l0cyB0aGUg
J211bHRpLXRhcmdldCBwYXR0ZXJuIHJ1bGUnIHRyaWNrLgo+Pj4gKyMgVGhlIHN5bmNjb25maWcg
c2hvdWxkIGJlIGV4ZWN1dGVkIG9ubHkgb25jZSB0byBtYWtlIGFsbCB0aGUgdGFyZ2V0cy4KPj4+
ICtpbmNsdWRlL2NvbmZpZy8lLmNvbmYgaW5jbHVkZS9jb25maWcvJS5jb25mLmNtZDogJChLQ09O
RklHX0NPTkZJRykKPj4+ICsJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFr
ZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChI
T1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiBzeW5jY29uZmlnCj4+Cj4+IC4uLiB0aGlzIGFy
ZSBhbG1vc3QgaWRlbnRpY2FsLCBwcmV0dHkgbG9uZyBsaW5lcy4gQ2FuIHRoaXMgYmUgbWFjcm9p
emVkLAo+PiBwbGVhc2UsIHdpdGggdGhlIGFjdHVhbCBtYWtlIGdvYWwgYXMgcGFyYW1ldGVyPwo+
IAo+IFNvdW5kIGdvb2QsIHdvdWxkIHRoZSBmb2xsb3dpbmcgYmUgZmluZT8KPiAKPiBrY29uZmln
ID0gLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFS
Q0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NU
Q1hYKSIKPiBjb25maWc6Cj4gICAgICQoTUFLRSkgJChrY29uZmlnKSAkQAo+IAo+IEkgd2lsbCBw
dXQgdGhhdCBuZXcgYGtjb25maWcnIG1hY3JvIGluIEtidWlsZC5pbmNsdWRlLCBhbG9uZyB0aGUK
PiBzaG9ydGhhbmQgZm9yIGNsZWFuLgoKTG9va3Mgb2theSBhdCB0aGUgZmlyc3QgZ2xhbmNlLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
