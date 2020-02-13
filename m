Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9AA15BE37
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:05:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2DDe-00012F-20; Thu, 13 Feb 2020 12:03:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2DDd-000129-34
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:03:45 +0000
X-Inumbo-ID: e16b462b-4e58-11ea-b88b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e16b462b-4e58-11ea-b88b-12813bfff9fa;
 Thu, 13 Feb 2020 12:03:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DDa-0006gH-SF; Thu, 13 Feb 2020 12:03:42 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DDZ-0005lP-U3; Thu, 13 Feb 2020 12:03:42 +0000
Date: Thu, 13 Feb 2020 12:03:38 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200213120338.2jydr6luxwo544jk@debian>
References: <20200212074154.23755-1-jgross@suse.com>
 <20200212074154.23755-3-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212074154.23755-3-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 2/3] xenstore: add console xenstore
 entries for xenstore stubdom
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDg6NDE6NTNBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBJbiBvcmRlciB0byBiZSBhYmxlIHRvIGNvbm5lY3QgdG8gdGhlIGNvbnNvbGUgb2Yg
WGVuc3RvcmUgc3R1YmRvbSB3ZQo+IG5lZWQgdG8gY3JlYXRlIHRoZSBhcHByb3ByaWF0ZSBlbnRy
aWVzIGluIFhlbnN0b3JlLgo+IAo+IEZvciB0aGUgbW9tZW50IHdlIGRvbid0IHN1cHBvcnQgeGVu
Y29uc29sZWQgbGl2aW5nIGluIGFub3RoZXIgZG9tYWluCj4gdGhhbiBkb20wLCBhcyB0aGlzIGlu
Zm9ybWF0aW9uIGlzbid0IGF2YWlsYWJsZSBvdGhlciB0aGVuIHZpYQo+IFhlbnN0b3JlIHdoaWNo
IHdlIGFyZSBqdXN0IHNldHRpbmcgdXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
