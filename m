Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB9618E2FC
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2020 17:48:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFhE8-0002Ia-LM; Sat, 21 Mar 2020 16:44:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uw1z=5G=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jFhE7-0002IV-Fs
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2020 16:43:59 +0000
X-Inumbo-ID: 2912cc76-6b93-11ea-bf85-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2912cc76-6b93-11ea-bf85-12813bfff9fa;
 Sat, 21 Mar 2020 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=0v2byvww+3KFsm6QtDhqJbdwc/aGMtXaHNonEpQEHqM=; b=ngX/wAPkW1NNWXUA4fz2TPy4G5
 HsMI4LeE4I3qFsEtTbBgWQ5kkfMYcHRw77t6fWSBq83z0YsEB2TShF369/lYeM0XQNaTRe5eGweLk
 P7UbR9+rmuAUk9Poo+QRzTsapZ+OyTJXBGWNHP+EI7pSnmxRcTikfXHxaVKGBrckTj/s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jFhE4-0006s3-3r; Sat, 21 Mar 2020 16:43:56 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jFhE3-0001kH-Pq; Sat, 21 Mar 2020 16:43:56 +0000
Date: Sat, 21 Mar 2020 16:43:53 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20200321164353.wu6uq7h7mlgjqdky@debian>
References: <20200318165151.21443-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318165151.21443-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v1] libxl: Fix xl shutdown for HVM without
 PV drivers
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTgsIDIwMjAgYXQgMDU6NTE6NTFQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQSByZXR1cm4gdmFsdWUgb2YgemVybyBtZWFucyBubyBQViBkcml2ZXJzLiBSZXN0b3Jl
IGEgaHVuayB3aGljaCB3YXMgcmVtb3ZlZC4KPiAKPiBGaXhlcyBjb21taXQgYjE4M2UxODBiY2U5
MzAzN2QzZWYzODVhOGMyMzM4YmJmYjdmMjNkOQo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sYWYgSGVy
aW5nIDxvbGFmQGFlcGZsZS5kZT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKQW5k
IGFwcGxpZWQuCgo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyB8IDMgKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGwvbGlieGxfZG9tYWluLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwo+IGluZGV4
IDQxZDA4Mzk0ZjMuLmZlZjJjZDRlMTMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
ZG9tYWluLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwo+IEBAIC03NzQsNiAr
Nzc0LDkgQEAgaW50IGxpYnhsX19kb21haW5fcHZjb250cm9sKGxpYnhsX19lZ2MgKmVnYywgbGli
eGxfX3hzd2FpdF9zdGF0ZSAqcHZjb250cm9sLAo+ICAgICAgaWYgKHJjIDwgMCkKPiAgICAgICAg
ICByZXR1cm4gcmM7Cj4gIAo+ICsgICAgaWYgKCFyYykKPiArICAgICAgICByZXR1cm4gRVJST1Jf
Tk9QQVJBVklSVDsKPiArCj4gICAgICBzaHV0ZG93bl9wYXRoID0gbGlieGxfX2RvbWFpbl9wdmNv
bnRyb2xfeHNwYXRoKGdjLCBkb21pZCk7Cj4gICAgICBpZiAoIXNodXRkb3duX3BhdGgpCj4gICAg
ICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
