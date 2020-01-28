Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95814BCAA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:16:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSYo-0007Z6-2G; Tue, 28 Jan 2020 15:13:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/zE=3R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwSYm-0007Yz-3t
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:13:48 +0000
X-Inumbo-ID: c7e43452-41e0-11ea-8396-bc764e2007e4
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7e43452-41e0-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 15:13:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id a9so2948678wmj.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZfmqLVvwsHIoojXd+z4d9EnguiciBG0CjpKdYP+SpSM=;
 b=eNyO1VZQYV/DLwMV21y5lwNLSZtdW39fUBZznPVBAKgbUilAWEw/w9CeJEjjTgt2Cu
 GSbXSsHPSoZqeMAyIqmO+29TnTJ5iyFFJOEdKaaiu9wtu9KIFo1Y25LPBJm4A8l1qs+O
 BofmwEtw/x5o8H4i5JZR0/5DIxKkIW+wuZ7bY8qb7z+hc5df7OnRjwOKUBGNw+1L8PPq
 JeASSQ4M7FwvFrPntmIBlno2F7hQnzW043gU5r7cgz4yCRx7Qc/eUYicqEpqoKOPEVfC
 VSiGWZTdFVJvMyc478+1ACusE6OazjOYiH9eW+7tcMHJJ2lNR6YKoLgcDa22/GzRjbDB
 QG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfmqLVvwsHIoojXd+z4d9EnguiciBG0CjpKdYP+SpSM=;
 b=lmnq+JR2v68vJpxeu49GAU9yL8mxkA00bWJRRc20jAljATtUINL6uFaaENB4s307YZ
 o27ABIkOM/WVbLZX6X2cvLIWnR5BzMy5CSlhQNOOW+fN7pt3MD8+/9C2Fa4gqHn/v134
 aL9v2XzLogCRHm5bYcvwO0DVWac/5Ti/D33se5biAW/x+DGH0DCCmyC2Acbb/YcZ9Eqr
 Jec03u4tUoPsgC+amVA/mf9CIycvujIFl0G7Qurss8QJXphDWMqGTkwiTezojjWHz7bb
 vzI2ijYTxN86i1J9VpIS1i6rj6ZahxC9vaPO4I8sOcud7P6v0TxN2rdhML9lU8axhI9N
 bs3w==
X-Gm-Message-State: APjAAAWzkjUnwR+6/f6qRI2vZ+aBGDtrhTEDRo22vDXQgBmxZpTTC7/r
 0fRT0geXrd6bSWuwtfcpk+c7ocEw5pag2KMQlIU=
X-Google-Smtp-Source: APXvYqwddQU7P6auzCvfjzCdQIzd2Sbb4vEwX+t58XRhbFhciceRDnFSoP1nK0PRGFzT/ci2eMob1EVdeG8zXlQ1IRI=
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr5493845wma.84.1580224426656; 
 Tue, 28 Jan 2020 07:13:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <de8e30d7bdc25e509f7da0affc9c77f8c1a49599.1580148227.git.tamas.lengyel@intel.com>
In-Reply-To: <de8e30d7bdc25e509f7da0affc9c77f8c1a49599.1580148227.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 28 Jan 2020 08:13:10 -0700
Message-ID: <CABfawhmUZgwSLauETXxY-8Eax2qGgaKb_SWBkTydC5kVcu9V3A@mail.gmail.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [Xen-devel] [PATCH v6 8/9] x86/mem_sharing: reset a fork
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiArICAgIGlmICggIShyYyA9IGh2bV9jb3B5X2NvbnRleHRfYW5kX3BhcmFtcyhkLCBjZCkpICkK
CkkganVzdCByZWFsaXplZCB0aGF0IEkgZm9yZ290IHRvIHN3YXAgdGhlIG9yZGVyIG9mIHRoZSBw
YXJhbWV0ZXJzIGhlcmUKYWZ0ZXIgdGhlIHJlcXVlc3RlZCBjaGFuZ2Ugd2FzIG1hZGUgaW4gdGhl
IHByZXJlcSBwYXRjaCBpbnRyb2R1Y2luZwp0aGUgZnVuY3Rpb24uCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
