Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA512135AB9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:54:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYEh-0004Jq-5y; Thu, 09 Jan 2020 13:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wgv1=26=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipYEf-0004Jh-Am
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 13:52:29 +0000
X-Inumbo-ID: 415cf4a8-32e7-11ea-b89f-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 415cf4a8-32e7-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 13:52:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so7492983wro.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 05:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qfrpsf6v/ofYqJeHycIf/UYwCAXdlM0sYGoO85orzWc=;
 b=btTqYVqgZDrsIvkgVc3j45FMRUFOrRpIdzG35FwBe6+cK8i9ghUYk/gblcdStwKZ1l
 XeF2FLlULo6Wn8eQuBp5vLQcF9r8AiOVEDF/aKMyxiDuPn829RMhfR/QPL/O9VHVqHom
 DzmA4Z67Ulh7h6sRb3sblOuEHIzI51XxcYChWk6mpk34PcmvBn9LBuutfyjqqSpxtbmN
 HquFmQcZ1SWBcnU3GUzTP868xFSdj8x55DBjyxa1tTk3Tc39eDl4j69q6F5sG6LdeuNk
 LnND+uMptrqIemm4hALlh4TG7rXqsjWJd3XzK5PD09xLQ0nmVoqvNpZAqW8M6DNSwy+g
 nDLA==
X-Gm-Message-State: APjAAAW8p9WgPzSqBNKZXwr4VN6Ift10/jSzy2gBYfL2ZoqkeSfjuKiM
 zroy4TpoSMDyg/7i9tEKjAM=
X-Google-Smtp-Source: APXvYqwww/32r/UtBmZL7VbqO02C8GuICr+wOM9hQN7B3m62oUx9MaSkQBfXWGgvYG8o2rviG9VzWg==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr11548275wrq.348.1578577940057; 
 Thu, 09 Jan 2020 05:52:20 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id t1sm2985718wma.43.2020.01.09.05.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 05:52:19 -0800 (PST)
Date: Thu, 9 Jan 2020 13:52:17 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200109135217.wdvaxvp2i7jemqsv@debian>
References: <20200109111505.12328-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109111505.12328-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
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

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMTE6MTU6MDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFJ1bm5pbmcgJ21ha2UgZGlzdGNsZWFuJyB1bmRlciB0b29scyB3aWxsIGN1cnJlbnRs
eSByZXN1bHQgaW46Cj4gCj4gdG9vbHMvUnVsZXMubWs6MjQ1OiAqKiogWW91IGhhdmUgdG8gcnVu
IC4vY29uZmlndXJlIGJlZm9yZSBidWlsZGluZyBvciBpbnN0YWxsaW5nIHRoZSB0b29scy4gIFN0
b3AuCj4gCj4gVGhpcyBwYXRjaCBhZGRzICdkaXN0Y2xlYW4nLCAnc3ViZGlyLWRpc3RjbGVhbiUn
IGFuZCAnc3ViZGlyLWNsZWFuJScgdG8KPiBuby1jb25maWd1cmUtdGFyZ2V0cywgd2hpY2ggYWxs
b3dzICdtYWtlIGRpc3RjbGVhbicgdG8gcnVuIHRvIGNvbXBsZXRpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKRml4ZXM6IDAwNjkxYzZj
OTBiCgpTb3JyeSBmb3Igbm90IG5vdGljaW5nIHRoZSBicmVha2FnZSB3aGlsZSByZXZpZXdpbmcg
dGhhdCBwYXRjaC4KCklzIHRoZXJlIGEgd2F5IHRvIHBhdHRlcm4gbWF0Y2ggYWxsIHRhcmdldHMg
Y29udGFpbmluZyAiY2xlYW4iPwoKKFdvdWxkIGhhdmUgbG9va2VkIGludG8gaXQgbXlzZWxmIGJ1
dCAtRVRJTUUgdG9kYXkpCgo+IC0tLQo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAtLS0KPiAgdG9vbHMvUnVs
ZXMubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9SdWxlcy5tayBiL3Rvb2xzL1J1bGVzLm1rCj4g
aW5kZXggMzFjZjQxOWVmNC4uNTJmNDdiZTNmOCAxMDA2NDQKPiAtLS0gYS90b29scy9SdWxlcy5t
awo+ICsrKyBiL3Rvb2xzL1J1bGVzLm1rCj4gQEAgLTIzOSw3ICsyMzksNyBAQCBzdWJkaXItYWxs
LSUgc3ViZGlyLWNsZWFuLSUgc3ViZGlyLWluc3RhbGwtJSBzdWJkaXItdW5pbnN0YWxsLSU6IC5w
aG9ueQo+ICBzdWJkaXItZGlzdGNsZWFuLSU6IC5waG9ueQo+ICAJJChNQUtFKSAtQyAkKiBkaXN0
Y2xlYW4KPiAgCj4gLW5vLWNvbmZpZ3VyZS10YXJnZXRzIDo9IGNsZWFuIHN1YnRyZWUtZm9yY2Ut
dXBkYXRlLWFsbCAlLWRpci1mb3JjZS11cGRhdGUKPiArbm8tY29uZmlndXJlLXRhcmdldHMgOj0g
ZGlzdGNsZWFuIHN1YmRpci1kaXN0Y2xlYW4lIGNsZWFuIHN1YmRpci1jbGVhbiUgc3VidHJlZS1m
b3JjZS11cGRhdGUtYWxsICUtZGlyLWZvcmNlLXVwZGF0ZQo+ICBpZmVxICgsJChmaWx0ZXIgJChu
by1jb25maWd1cmUtdGFyZ2V0cyksJChNQUtFQ01ER09BTFMpKSkKPiAgJChYRU5fUk9PVCkvY29u
ZmlnL1Rvb2xzLm1rOgo+ICAJJChlcnJvciBZb3UgaGF2ZSB0byBydW4gLi9jb25maWd1cmUgYmVm
b3JlIGJ1aWxkaW5nIG9yIGluc3RhbGxpbmcgdGhlIHRvb2xzKQo+IC0tIAo+IDIuMjAuMQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
