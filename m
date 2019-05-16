Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2CA20038
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 09:25:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRAiN-0003dA-QP; Thu, 16 May 2019 07:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRAiM-0003d5-D5
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 07:22:06 +0000
X-Inumbo-ID: 4c56108a-77ab-11e9-beb0-672cd6c16123
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c56108a-77ab-11e9-beb0-672cd6c16123;
 Thu, 16 May 2019 07:22:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 01:22:00 -0600
Message-Id: <5CDD0F96020000780022F740@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 01:21:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>
References: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
 <5CDBBEB5020000780022F176@prv1-mh.provo.novell.com>
 <87bm038rjn.fsf@epam.com>
In-Reply-To: <87bm038rjn.fsf@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1 1/2] makefile: add support for
 *_defconfig targets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE1LjA1LjE5IGF0IDIxOjA3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgoKPiBIZWxsbyBKYW4sCj4gCj4gSmFuIEJldWxpY2ggd3JpdGVzOgo+IAo+Pj4+PiBPbiAx
NC4wNS4xOSBhdCAyMDo0NSwgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPiB3cm90ZToKPj4+
IC0tLSBhL3hlbi9NYWtlZmlsZQo+Pj4gKysrIGIveGVuL01ha2VmaWxlCj4+PiBAQCAtMjY5LDYg
KzI2OSw5IEBAIGtjb25maWcgOj0gc2lsZW50b2xkY29uZmlnIG9sZGNvbmZpZyBjb25maWcgbWVu
dWNvbmZpZyAKPiBkZWZjb25maWcgXAo+Pj4gICQoa2NvbmZpZyk6Cj4+PiAgCSQoTUFLRSkgLWYg
JChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIAo+
IFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hY
KSIgJEAKPj4KPj4gU28gdGhlIHJ1bGUgeW91IGFkZCBtYXRjaGVzIHRoaXMgb25lLiBJcyB0aGVy
ZSBhIHJlYXNvbiAuLi4KPj4KPj4+ICslX2RlZmNvbmZpZzoKPj4KPj4gLi4uIHdoeSB5b3UgY2Fu
J3Qgc2ltcGx5IGFkZCB0aGlzIHRvIHRoZSBrY29uZmlnIHZhcmlhYmxlIHNldCBhIGZldwo+PiBs
aW5lcyB1cD8gT2ggLSBuZXdlciBtYWtlIGRvZXNuJ3QgbGlrZSBtaXhpbmcgcGF0dGVybiBhbmQK
Pj4gbm9uLXBhdHRlcm4gcnVsZXMuCj4gWWVzLCBteSBmaXJzdCBpbnRlbnRpb24gd2FzIHRvIGFk
ZCB0aGlzIHJ1bGUgdG8gdGhlIGtjb25maWcgdmFyaWFibGUuCj4gU2FkbHkgbWFrZSBkb2VzIG5v
dCBhbGxvd3MgdGhpcwo+IAo+PiBQZXJoYXBzIHdvcnRoIGEgYnJpZWYgY29tbWVudCwgdG8ganVz
dGlmeSB0aGUKPj4gcmVkdW5kYW5jeT8KPiBTdXJlLCB3aWxsIGFkZCBpbiB0aGUgbmV4dCB2ZXJz
aW9uLgo+IAo+PiBPciBhbHRlcm5hdGl2ZWx5LCBob3cgYWJvdXQgdXNpbmcgJCh3aWxkY2FyZCAp
Cj4+IGluc3RlYWQgb2YgYSBwYXR0ZXJuIHJ1bGUsIHRodXMgcmVqZWN0aW5nIGludmFsaWQgdGFy
Z2V0cyByaWdodCBhd2F5LAo+PiByYXRoZXIgdGhhbiBkZWZlcnJpbmcgdG8gdGhlIHJlY3Vyc2l2
ZSBtYWtlIHRvIG5vdGljZSB0aGUgZXJyb3I/Cj4gSSBjb25zaWRlcmVkIHRoaXMsIGJ1dCBJIGNh
bid0IHNlZSBob3cgJCh3aWxkY2FyZCApIGNhbiBiZSB1c2VkLgo+IEFGQUlLLCAkKHdpbGRjYXJk
ICkgZXhwZWN0cyB0byBmaW5kIGEgZmlsZSwgbWF0Y2hpbmcgdGhlIHdpbGRjYXJkLgo+IEJ1dCAl
X2RlZmNvbmZpZyBpcyB0aGUgcGhvbnkgcnVsZSwgc28gSSBjYW4ndCBpbWFnaW5lIGhvdyB0byB1
c2UKPiAkKHdpbGRjYXJkICkgaW4gdGhpcyBjYXNlLgo+IAo+IE9uIG90aGVyIGhhbmQsIGZvbGxv
d2luZyBydWxlIGNoZWNrcyB0aGUgcHJlc2VuY2Ugb2YgcmVxdWlyZWQgX2RlZmNvbmZpZyAKPiBm
aWxlOgo+IAo+ICVfZGVmY29uZmlnOiBhcmNoLyQoU1JDQVJDSCkvY29uZmlncy8lX2RlZmNvbmZp
ZwoKQW5kIHNpbWlsYXJseSBJJ2QgZXhwZWN0ICQod2lsZGNhcmQgYXJjaC8kKFNSQ0FSQ0gpL2Nv
bmZpZ3MvKl9kZWZjb25maWcpCnRvIHdvcmsgYXMgc3VnZ2VzdGVkICh3cmFwcGVkIGluICQobm90
ZGlyIC4uLikgdG8gc3RyaXAgdGhlIHBhdGgpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
