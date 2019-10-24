Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE280E2C6D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 10:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNYif-0003U7-GK; Thu, 24 Oct 2019 08:43:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNYie-0003U0-Ew
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 08:43:44 +0000
X-Inumbo-ID: 624fedd0-f63a-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 624fedd0-f63a-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 08:43:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A77E3AD00;
 Thu, 24 Oct 2019 08:43:42 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191015154736.19882-1-roger.pau@citrix.com>
 <20191015154736.19882-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <092dbe0a-edba-2070-a5db-f281c766b21b@suse.com>
Date: Thu, 24 Oct 2019 10:43:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015154736.19882-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/4] x2APIC: translate IO-APIC entries
 when enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMjAxOSAxNzo0NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gaW50ZXJy
dXB0IHJlbWFwcGluZyBpcyBlbmFibGVkIGFzIHBhcnQgb2YgZW5hYmxpbmcgeDJBUElDIHRoZQo+
IElPLUFQSUMgZW50cmllcyBhbHNvIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB0aGUgbmV3IGZv
cm1hdCBhbmQgYWRkZWQKPiB0byB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZS4KPiAKPiBU
aGlzIHByZXZlbnRzIElPTU1VIGludGVycnVwdCByZW1hcHBpbmcgZmF1bHRzIHdoZW4gYm9vdGlu
ZyBvbgo+IGhhcmR3YXJlIHRoYXQgaGFzIHVubWFza2VkIElPLUFQSUMgcGlucy4KPiAKPiBSZXBv
cnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
