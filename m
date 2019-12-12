Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75711CF93
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:18:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPFs-0000dB-S0; Thu, 12 Dec 2019 14:15:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rxjx=2C=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ifPFs-0000d6-03
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:15:48 +0000
X-Inumbo-ID: df791cac-1ce9-11ea-a914-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df791cac-1ce9-11ea-a914-bc764e2007e4;
 Thu, 12 Dec 2019 14:15:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so2861199wrl.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 06:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3Yd2wug88oEKebWlvZ4iJ5Yh0jzJzTPc9J8K+vEAVew=;
 b=G9KqgAmMx7Yu4wO4y4gwlYaw8hSjY+/1N4nymSfAD9mEHgjzs0Rpp+CEw60HK5Y5T2
 piD/QuQIZ6aiqGBtxnhlKuqlgcDH27BODNUMeFtyrR/mbRnQwjWz/CKtDaR9qRZddJdX
 2OQkCKETxTYPMokHjrln1zI+c11B9gI5q/X/YzMQb/l3+HZ/Hnw7g0hHw/JlqNvQagZl
 tl5rVLRXxpxre6A07e06e8438TdD8ttOj1VTjBg3HKWuYJWCiVlPvdShewUn9L88itta
 l70RvCcwaumLtDImghig/YBisMS3jp2o0gJJncUCVhSjtPxrID+8qE/RAee+vyNcwWmx
 7Mgw==
X-Gm-Message-State: APjAAAWZaW8fAvvGAQADXKy/2bh3BVJMBL11U2LPuPIkgRDsnvuHF3VX
 7ZEo4P+t2QDwNEB6vCIL/bA=
X-Google-Smtp-Source: APXvYqwlvs7g0iihCYG/j+YEodtrNqokR+IF7bvKm9kERaPeionQwFgxTtTluELPKnsZ7tqWeOHMgQ==
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr6604214wrs.247.1576160138730; 
 Thu, 12 Dec 2019 06:15:38 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id f1sm6418056wrp.93.2019.12.12.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 06:15:37 -0800 (PST)
Date: Thu, 12 Dec 2019 14:15:35 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191212141535.2d6whyrqnti45anr@debian>
References: <20191211165659.29939-1-jgross@suse.com>
 <24050.19092.298544.991905@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24050.19092.298544.991905@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH-for-4.13] build: fix tools/configure in case
 only python3 exists
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDI6MTE6MzJQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhhbmtzIGZvciB0aWR5aW5nIHRoaXMgdXAuCj4gCj4gSnVlcmdlbiBHcm9zcyB3cml0
ZXMgKCJbUEFUQ0gtZm9yLTQuMTNdIGJ1aWxkOiBmaXggdG9vbHMvY29uZmlndXJlIGluIGNhc2Ug
b25seSBweXRob24zIGV4aXN0cyIpOgo+ID4gLUFTX0lGKFt0ZXN0IC16ICIkUFlUSE9OIl0sIFtQ
WVRIT049InB5dGhvbiJdKQo+ID4gLUFTX0lGKFtlY2hvICIkUFlUSE9OIiB8IGdyZXAgLXEgIl4v
Il0sIFtdLCBbUFlUSE9OPWB0eXBlIC1wICIkUFlUSE9OImBdKQo+ID4gK0FTX0lGKFt0ZXN0IC16
ICIkUFlUSE9OIl0sIFtBQ19DSEVDS19QUk9HUyhbUFlUSE9OXSwgW3B5dGhvbiBweXRob24zIHB5
dGhvbjJdLCBlcnIpXSkKPiA+ICtBU19JRihbdGVzdCAiJFBZVEhPTiIgPSAiZXJyIl0sIFtBQ19N
U0dfRVJST1IoW05vIHB5dGhvbiBpbnRlcnByZXRlciBmb3VuZF0pXSkKPiAKPiBJIHRoaW5rIHRo
aXMgdXNlIG9mIGBlcnInIGlzIGEgYml0IG9kZC4gIEFjY29yZGluZyB0byB0aGUgRk0geW91IGNv
dWxkCj4gc2F5IHNpbXBseToKPiAKPiAgICtBU19JRihbdGVzdCAteiAiJFBZVEhPTiJdLCBbQUNf
Q0hFQ0tfUFJPR1MoW1BZVEhPTl0sIFtweXRob24gcHl0aG9uMyBweXRob24yXSldKQo+ICAgK0FT
X0lGKFt0ZXN0IC16ICIkUFlUSE9OIl0sIFtBQ19NU0dfRVJST1IoW05vIHB5dGhvbiBpbnRlcnBy
ZXRlciBmb3VuZF0pXSkKPiAKPiBCdXQgdGhpcyBpcyBhIHN0eWxlIG5pdCBJIHRoaW5rIHNpbmNl
IG5vLW9uZSB3aWxsIGNhbGwgdGhlaXIgcHl0aG9uCj4gaW50ZXJwcmV0ZXIgYGVycicgOi0pLiAg
QW5kIHlvdSB3aWxsIGhhdmUgdGVzdGVkIHlvdXIgdmVyc2lvbiBhbmQgYXQKPiB0aGlzIHN0YWdl
IG9mIDQuMTMgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgZmV3ZXIgaXRlcmF0aW9ucyBvZiB0
aGlzCj4gcGF0Y2gsIHNvIEkgdGhpbmsgaXQgc2hvdWxkIGdvIGluIGFzIGl0IGlzLgo+IAo+ID4g
K0FTX0lGKFtlY2hvICIkUFlUSE9OIiB8IGdyZXAgLXEgIl4vIl0sIFtdLCBbQUNfUEFUSF9QUk9H
KFtQWVRIT05dLCBbJFBZVEhPTl0pXSkKPiAKPiBUaGFua3MuCj4gCj4gUmV2aWV3ZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtzLiBJIHdpbGwgcHVz
aCB0aGlzIHRvIHN0YWdpbmcgYW5kIHN0YWdpbmctNC4xMyBzaG9ydGx5LgoKV2VpLgoKPiAKPiBJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
