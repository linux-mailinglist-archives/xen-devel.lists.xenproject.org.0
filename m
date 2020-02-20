Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FC165CEE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:47:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kFr-0000fH-Gg; Thu, 20 Feb 2020 11:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4kFp-0000f9-La
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:44:29 +0000
X-Inumbo-ID: 5a414c7a-53d6-11ea-aa99-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a414c7a-53d6-11ea-aa99-bc764e2007e4;
 Thu, 20 Feb 2020 11:44:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kFo-0007FV-3J; Thu, 20 Feb 2020 11:44:28 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kFn-0008GP-R2; Thu, 20 Feb 2020 11:44:28 +0000
Date: Thu, 20 Feb 2020 11:44:25 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220114425.3wfpvncxvxnxpmyj@debian>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
 <7c8de367-4833-c603-fcdd-89c1e6ceda3a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c8de367-4833-c603-fcdd-89c1e6ceda3a@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 3/5] libxl/PCI: make "rdm=" parsing comply
 with documentation
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDQ6NDc6MDRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRG9jdW1lbnRhdGlvbiBzYXlzICI8UkRNX1JFU0VSVkFUSU9OX1NUUklORz4gaXMgYSBj
b21tYSBzZXBhcmF0ZWQgbGlzdAo+IG9mIDxLRVk9VkFMVUU+IHNldHRpbmdzLCBmcm9tIHRoZSBm
b2xsb3dpbmcgbGlzdCIuIFRoZXJlJ3Mgbm8gbWVudGlvbgo+IG9mIGEgc3BlY2lmaWMgb3JkZXIs
IHlldCBzbyBmYXIgdGhlIHBhcnNpbmcgbG9naWMgZGlkIGFjY2VwdCBvbmx5Cj4gc3RyYXRlZ3ks
IHRoZW4gcG9saWN5IChhbmQgbmVpdGhlciBvZiB0aGUgdHdvIG9taXR0ZWQpLiBNYWtlICJzdGF0
ZSIKPiBtb3ZlCj4gLSBiYWNrIHRvIFNUQVRFX1RZUEUgd2hlbiBmaW5kaW5nIGEgY29tbWEgYWZ0
ZXIgaGF2aW5nIHBhcnNlZCB0aGUKPiAgIDxWQUxVRT4gcGFydCBvZiBhIHNldHRpbmcsCj4gLSB0
byBTVEFURV9URVJNSU5BTCBvdGhlcndpc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
