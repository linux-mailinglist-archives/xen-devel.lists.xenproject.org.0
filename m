Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6116120353
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:09:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igoDU-0003FW-Be; Mon, 16 Dec 2019 11:07:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igoDS-0003FR-LM
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:07:06 +0000
X-Inumbo-ID: 30d74d3c-1ff4-11ea-9385-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30d74d3c-1ff4-11ea-9385-12813bfff9fa;
 Mon, 16 Dec 2019 11:07:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9668DAD2D;
 Mon, 16 Dec 2019 11:07:03 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191213173742.1960441-1-george.dunlap@citrix.com>
 <20191213173742.1960441-2-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba4eb59e-ac37-6ec2-e699-d359f1565cf5@suse.com>
Date: Mon, 16 Dec 2019 12:07:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213173742.1960441-2-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/mm: Use a more descriptive name for
 pagetable mfns
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxODozNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBJbiBtYW55IHBsYWNl
cywgYSBQVEUgYmVpbmcgbW9kaWZpZWQgaXMgYWNjb21wYW5pZWQgYnkgdGhlIHBhZ2V0YWJsZQo+
IG1mbiB3aGljaCBjb250YWlucyB0aGUgUFRFIChwcmltYXJpbHkgaW4gb3JkZXIgdG8gYmUgYWJs
ZSB0byBtYWludGFpbgo+IGxpbmVhciBtYXBwaW5nIGNvdW50cykuICBJbiBtYW55IGNhc2VzLCB0
aGlzIG1mbiBpcyBzdG9yZWQgaW4gdGhlCj4gbm9uLWRlc2NyaXB0IHZhcmlhYmxlIChvciBhcmdl
bWVudCkgInBmbiIuCj4gCj4gUmVwbGFjZSB0aGVzZSBuYW1lcyB3aXRoIGxObWZuLCB0byBpbmRp
Y2F0ZSB0aGF0IDEpIHRoaXMgaXMgYQo+IHBhZ2V0YWJsZSBtZm4sIGFuZCAyKSB0aGF0IGl0IGlz
IHRoZSBzYW1lIGxldmVsIGFzIHRoZSBQVEUgaW4KPiBxdWVzdGlvbi4gIFRoaXMgc2hvdWxkIGJl
IGVub3VnaCB0byByZW1pbmQgcmVhZGVycyB0aGF0IGl0J3MgdGhlIG1mbgo+IGNvbnRhaW5pbmcg
dGhlIFBURS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSB0YWtlIGl0IHlvdSBjb25zaWRlcmVkIGJ5IGRy
b3BwZWQgdGhlIGlkZWEgb2Ygc3dpdGNoaW5nIHRvIG1mbl90CmF0IHRoZSBzYW1lIHRpbWUsIGFz
IHN1Z2dlc3RlZCBieSBBbmRyZXcgb24gdjE/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
