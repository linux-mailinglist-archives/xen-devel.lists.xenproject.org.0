Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6671844BF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:22:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jChQE-0000Wk-4n; Fri, 13 Mar 2020 10:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r42=46=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jChQD-0000Rb-9Z
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:20:05 +0000
X-Inumbo-ID: 34da03f6-6514-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34da03f6-6514-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NMC6gE0neosEr4cdLzfr7puH0XVnf9+eBzv/hHln54=; b=tqVPutP3XPaMylw//H+9xhCwzd
 V1RKnYbfvsWLsP0QdSu1NZUzQL1pH13bvFL6zBKI1iP9qX90+fgnVSeAJEHcyka/1S2iPZ6r0Q9op
 5+OX4/yO3i6KVhTk/o2hf9B1LQjVc3/24oIiOrKc+l/JWg8FAUsW4xcaym0x9Rw9aGYo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jChQC-0001FV-4v; Fri, 13 Mar 2020 10:20:04 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jChQB-0007LP-Ru; Fri, 13 Mar 2020 10:20:04 +0000
Date: Fri, 13 Mar 2020 10:20:01 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200313102001.iohqrquibvsee76a@debian>
References: <20200313084558.13759-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313084558.13759-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/2] libfsimage: fix clang 10 build
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

T24gRnJpLCBNYXIgMTMsIDIwMjAgYXQgMDk6NDU6NTdBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IGNsYW5nIGNvbXBsYWlucyB3aXRoOgo+IAo+IGZzeXNfemZzLmM6ODI2OjI6IGVy
cm9yOiBjb252ZXJ0aW5nIHRoZSBlbnVtIGNvbnN0YW50IHRvIGEgYm9vbGVhbiBbLVdlcnJvciwt
V2ludC1pbi1ib29sLWNvbnRleHRdCj4gICAgICAgICBWRVJJRllfRE5fVFlQRShkbiwgRE1VX09U
X1BMQUlOX0ZJTEVfQ09OVEVOVFMpOwo+ICAgICAgICAgXgo+IC93cmtkaXJzL3Vzci9wb3J0cy9z
eXN1dGlscy94ZW4tdG9vbHMvd29yay94ZW4tNC4xMy4wL3Rvb2xzL2xpYmZzaW1hZ2UvemZzLy4u
Ly4uLy4uL3Rvb2xzL2xpYmZzaW1hZ2UvemZzL2ZzeXNfemZzLmg6NzQ6MTE6IG5vdGU6IGV4cGFu
ZGVkIGZyb20gbWFjcm8gJ1ZFUklGWV9ETl9UWVBFJwo+ICAgICAgICAgaWYgKHR5cGUgJiYgKGRu
cCktPmRuX3R5cGUgIT0gdHlwZSkgeyBcCj4gICAgICAgICAgICAgICAgICBeCj4gMSBlcnJvciBn
ZW5lcmF0ZWQuCj4gCj4gRml4IHRoaXMgYnkgbm90IGZvcmNpbmcgYW4gaW1wbGljaXQgY29udmVy
c2lvbiBvZiB0aGUgZW51bSBpbnRvIGEKPiBib29sZWFuIGFuZCBpbnN0ZWFkIGNvbXBhcmluZyB3
aXRoIHRoZSAwIGVudW1lcmF0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpCb3RoIHBhdGNoZXM6CgpBY2tlZC1ieTogV2VpIExp
dSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
