Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99721837
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 14:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRc24-0007jO-Ry; Fri, 17 May 2019 12:32:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRc23-0007jH-DR
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:32:15 +0000
X-Inumbo-ID: cc52efb0-789f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc52efb0-789f-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 12:32:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 06:32:13 -0600
Message-Id: <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 06:32:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Viktor Mitin" <viktor.mitin.19@gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
In-Reply-To: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA1LjE5IGF0IDEzOjI1LCA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gSGkgQWxsLAo+IAo+IFdoaWxlIGxvb2tpbmcgYXQgY29kZSBpbiB0b29scy9saWJ4Yy94
Y19zcl9zYXZlX3g4Nl9wdi5jLAo+IHdlIHNlZSB0aGF0IHRoZXJlIGlzIGNhc3Rpbmcgb2YgeGVu
IHZpcnR1YWwgYWRkcmVzcyB0eXBlIHhlbl92YWRkcl90Cj4gdG8gc2lnbmVkIGludDY0IHR5cGUu
Cj4gSW4gY29tbWl0OiA3YmY3NDU4MmIzNDM2MDNjYjA4MjZkODA4Y2Q3ZGE0MzMyNjQ1MmE1Cj4g
Cj4gKy8qIENoZWNrIGEgNjQgYml0IHZpcnR1YWwgYWRkcmVzcyBmb3IgYmVpbmcgY2Fub25pY2Fs
LiAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfY2Fub25pY2FsX2FkZHJlc3MoeGVuX3ZhZGRy
X3QgdmFkZHIpCj4gK3sKPiArICAgIHJldHVybiAoKGludDY0X3QpdmFkZHIgPj4gNDcpID09ICgo
aW50NjRfdCl2YWRkciA+PiA2Myk7Cj4gK30KPiAKPiBJdCBzZWVtcyB0aGVyZSBpcyBubyBuZWVk
IHRvIGNhc3QgdmFkZHIgdmFyaWFibGUuIEl0IGxvb2tzIGxpa2UKPiBzaGlmdGluZyB2YWRkciBz
aWduZWQgNjQtYml0IHZhbHVlIGJ5IDYzIGJpdHMgaW50cm9kdWNlcyB1bmRlZmluZWQKPiBiZWhh
dmlvci4KCkkgZG9uJ3QgdGhpbmsgc28gLSBhcyBwZXIgbXkgcmVhZGluZyBvZiB0aGUgc3RhbmRh
cmQgdGV4dCwgVUIKcmVzdWx0cyBvbmx5IHdoZW4gdGhlIHNoaWZ0IGNvdW50IGlzIGdyZWF0ZXIg
b3IgZXF1YWwgdGhhbiB0aGUKd2lkdGggb2YgdGhlIChwcm9tb3RlZCkgc2hpZnRlZCB2YWx1ZSdz
IHR5cGUuIFRoZSByZXN1bHRzIG9mCmJvdGggc2hpZnRzIGFib3ZlIGFyZSBpbXBsZW1lbnRhdGlv
biBkZWZpbmVkIGFmYWljdC4KCj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSB3aGF0IGlzIHRo
ZSByZWFzb24gZm9yIHRoaXMgY2FzdGluZz8KCldlbGwsIHdlIHdhbnQgdG8gY2hlY2sgdGhhdCB0
aGUgdG9wIDE3IGJpdHMgYXJlIGVpdGhlciBhbGwgMXMKb3IgYWxsIDBzLCBwcmVmZXJhYmx5IHdp
dGgganVzdCBhIHNpbmdsZSBjb21wYXJpc29uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
