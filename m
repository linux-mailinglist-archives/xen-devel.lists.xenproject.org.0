Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73019D5D92
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 10:35:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJvlo-0002mh-3B; Mon, 14 Oct 2019 08:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TRx6=YH=kernel.org=shawnguo@srs-us1.protection.inumbo.net>)
 id 1iJvkh-0002kb-7R
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 08:30:51 +0000
X-Inumbo-ID: edb5f346-ee5c-11e9-9371-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edb5f346-ee5c-11e9-9371-12813bfff9fa;
 Mon, 14 Oct 2019 08:30:50 +0000 (UTC)
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5443B207FF;
 Mon, 14 Oct 2019 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571041850;
 bh=p7mjM/EcKkarwYBL8yjO5OkJb2HPOW4/n1CL+uOOlMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTnfmVLrzT1mElpLV1XpxtXmAYaHC4vXjDk1D8B2kTsZLHBXEuOXdUn57LgcXb0Ej
 h3mpF2mTZzuwOHBrv9gd3TZkQ4d/61IzyEHJNqi+GNSCzH6D3Q9rxbNjPNVhwsqsHm
 enxUHSuGte972ZNKUuW2YUasfYnn5BuldVKKqFww=
Date: Mon, 14 Oct 2019 16:29:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Message-ID: <20191014082924.GI12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-9-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924181244.7159-9-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 14 Oct 2019 08:31:58 +0000
Subject: Re: [Xen-devel] [PATCH 08/11] dts: arm64: layerscape: add
 dma-ranges property to pcie nodes
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDg6MTI6MzlQTSArMDIwMCwgTmljb2xhcyBTYWVueiBK
dWxpZW5uZSB3cm90ZToKPiBUaGUgYnVzIGJlaGluZCB0aGUgYm9hcmQncyBQQ0llIGNvcmUgaGFz
IERNQSBhZGRyZXNzaW5nIGxpbWl0YXRpb25zLiBBZGQKPiBhbiBlbXB0eSAnZG1hLXJhbmdlcycg
cHJvcGVydHkgb24gYWxsIFBDSWUgYnVzIGRlc2NyaXB0aW9ucyB0byBpbmZvcm0KPiB0aGUgT0Yg
Y29yZSB0aGF0IGEgdHJhbnNsYXRpb24gaXMgZHVlIGZ1cnRoZXIgZG93biB0aGUgbGluZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5uZUBz
dXNlLmRlPgoKQXBwbGllZCwgdGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
