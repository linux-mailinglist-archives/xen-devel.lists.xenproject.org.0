Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F713C90E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:35:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hae60-00058f-5U; Tue, 11 Jun 2019 10:33:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tchP=UK=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hae5y-00058Y-7V
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:33:38 +0000
X-Inumbo-ID: 5b40ae32-8c34-11e9-b3c7-cf951e255e81
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b40ae32-8c34-11e9-b3c7-cf951e255e81;
 Tue, 11 Jun 2019 10:33:33 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 11 Jun
 2019 18:30:20 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <dd5d7568496c0621a9794d280f62e7d3@sslemail.net>
 <8bd5cf31-d9c4-bae7-e18d-1ec01ce22046@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <ae4e0c1e-a6b2-43fd-9a1a-bbb7417cd2d7@mxnavi.com>
Date: Tue, 11 Jun 2019 18:33:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8bd5cf31-d9c4-bae7-e18d-1ec01ce22046@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: superficial clean-ups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMTc6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTEvMDYvMjAxOSAx
MDoyMCwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiAqIFJlbW92ZSByZWR1bmRhbnQgc2V0ICdET01E
WUlOR19kZWFkJwo+PiBkb21haW5fY3JlYXRlKCkgd2lsbCBzZXQgdGhpcyB3aGVuIGZhaWwsIHRo
dXMgbm8gbmVlZAo+PiBzZXQgaW4gYXJjaF9kb21haW5fY3JlYXRlKCkuCj4gSXRzIG5vdCByZWR1
bmRhbnQuwqAgSXQgaXMgbmVjZXNzYXJ5IGZvciBjb3JyZWN0IGNsZWFudXAuCgpIZWxsbyBBbmRy
ZXcsCgpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuCgpZb3VyIGNvbmNlcm4gaXM6IHdoZW4gdGhl
IGFyY2hfZG9tYWluX2NyZWF0ZSgpIGZhaWxzLAoKc29tZSBjbGVhbnVwIHdvcmsgbmVlZCB0byBk
b25lIGluIHRoaXMgZnVuY3Rpb24uCgphbmQgJ0RPTURZSU5HX2RlYWQnIGZsYWdzIG1heWJlIG5l
ZWRlZCB0byBqdWRnZSBmb3IgY29ycmVjdCBjbGVhbnVwPwoKSWYgc28sIGl0J3Mgbm90IHJlZHVu
ZGFudC4KCkknbSBjdXJpb3VzwqAgd2h5ICdET01EWUlOR19kZWFkJyBiZWVuIHNldCBieSBmYWls
IHBhdGggYm90aCBpbiAKYXJjaF9kb21haW5fY3JlYXRlKCkKCmFuZCBkb21haW5fY3JlYXRlKCku
Cgo+Cj4gQWxsIG9mIHRoaXMgbG9naWMgd2lsbCBiZSByZXdyaXR0ZW4gd2hlbiB0aGUgZGVzdHJv
eSBwYXRocyBhcmUgZnVsbHkKPiBpZGVtcG90ZW50LCBhbmQgd2hpbGUgQVJNIGlzIGZhaXJpbmcg
d2VsbCBpbiB0aGlzIHJlZ2FyZCwgdGhlIGNvbW1vbiBhbmQKPiB4ODYgbmVlZHMgbW9yZSB3b3Jr
Lgo+Cj4gfkFuZHJldwo+Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
