Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401910A010
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:15:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbaY-0007em-Jo; Tue, 26 Nov 2019 14:13:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBoB=ZS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZbaX-0007ed-79
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:13:09 +0000
X-Inumbo-ID: ddb5ee09-1056-11ea-a3a2-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddb5ee09-1056-11ea-a3a2-12813bfff9fa;
 Tue, 26 Nov 2019 14:13:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so19516379wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 06:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=egAEn6FTROHbNvFCb5lgpVbF4ap9innHefBhi5sRqJQ=;
 b=CD7lh+g7GwFJGReQv3OWZfTxOqn09eps5DycAjTex1U/7gvYI2dasDpSCZ+CkovxNN
 rwyC0tVfRxQIqDtX46bRuMt3ebij7APiUbHIaP4VN3L/CZ9zuPAYmt4JDyFSryxLey2A
 tOgVppb1nMCrQty1Q1Rz5DqK8Mu48wonTf+H4dcGW/HgmH8SF8Nq22qtYCiivbzC20w0
 DXEvmVUDAMieUdgIe7y9e/t4cIp6rmBmcTZeNJqRIrp0b+L7r9xX1UAD8jlempl7dtbA
 0SDF6KvnyH0+ynfRwVvPQ3HLOa2Cf0VsAx/MvUGoajWBAzt9td/Jh8GBv2Y0kezbC15r
 WpLw==
X-Gm-Message-State: APjAAAWzX1pwn5ziklrOGwcbT/mCk7eBxzwAcWhaizFl6HfswUyMG1aA
 DM7YHfMZfFneueIUlb867dU=
X-Google-Smtp-Source: APXvYqy/rFc/nCKdgY5rY/yvgsiQtKo40D/k8PEEntrnYPFj17misCOhhRxgM6ztnZzg2kBArh/QqQ==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr22431453wrq.272.1574777587505; 
 Tue, 26 Nov 2019 06:13:07 -0800 (PST)
Received: from debian ([185.111.131.198])
 by smtp.gmail.com with ESMTPSA id o1sm15165428wrs.50.2019.11.26.06.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:13:06 -0800 (PST)
Date: Tue, 26 Nov 2019 13:26:39 +0000
From: Wei Liu <wl@xen.org>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20191126132639.34bj2pwabggz3ihh@debian>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126141026.2858622-1-george.dunlap@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDI6MTA6MjZQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBDaGFuZ2VzZXRzIDMxOWY5YTBiYTkgKCJwYXNzdGhyb3VnaDogcXVhcmFudGluZSBQ
Q0kgZGV2aWNlcyIpIGFuZAo+IGJhMmFiMDBiYmIgKCJJT01NVTogZGVmYXVsdCB0byBhbHdheXMg
cXVhcmFudGluaW5nIFBDSSBkZXZpY2VzIikKPiBpbnRyb2R1Y2VkIFBDSSBkZXZpY2UgInF1YXJh
bnRpbmUiIGJlaGF2aW9yLCBidXQgZGlkIG5vdCBkb2N1bWVudCBob3cKPiB0aGUgcGNpLWFzc2ln
bmFibGUtYWRkIGFuZCAtcmVtb3ZlIGZ1bmN0aW9ucyBhY3QgaW4gcmVnYXJkIHRvIHRoaXMuCj4g
UmVjdGlmeSB0aGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KCkxHVE0uCgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
