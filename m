Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0614132871
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 15:06:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iopSV-0000Y7-83; Tue, 07 Jan 2020 14:03:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iopST-0000Y2-7F
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 14:03:45 +0000
X-Inumbo-ID: 83d9749c-3156-11ea-ac0c-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83d9749c-3156-11ea-ac0c-12813bfff9fa;
 Tue, 07 Jan 2020 14:03:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so19535296wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 06:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JNINrXuTKNonRtjTkgzaYKGsVHl+8n69Aulw84/szgI=;
 b=eWtywcMkV1AtaMQXNdjvKOVONZPrdPH7dblBrfMFnu/H1BJm2cYpxoQquCl05GQVJH
 YdEA4z6UfhZ+nZAv+k8bEHBsy6EpM2FBQ4vHHgZpWZuhuj4HmBFM0+BdzmV54DyAuLqv
 rXAwuwurmGgt+I5zNqTYP5oITsBtVhzjiYP6q9EMo80kQHIHz9J0iOMGyvIdTb2PYDsx
 cA0DK3Ymxp3IdFyMCjHtsQSmkY8VbxuWAhe4tWlcmQxPg7F4qrdmSFGsOMom00fhVwcA
 Wxww1Lafbw/mBWaUCMbWrRm/ELEKPT7r5Qez+iiR9iYiDn6CF1qTsaNdBFn8QRF8sJQ3
 lCeg==
X-Gm-Message-State: APjAAAXBA+uV8VLegncI5wiIpPHEKBl0Zh8aWrnl3jHQmGnmo/7V/3Pj
 SnXy71QjRAcmOzNVKaC7NG0=
X-Google-Smtp-Source: APXvYqxIXoleQJKYvhdOV2xaDYcSJd4kHHiUv8ukMMqepvYJ4dCjtHAdf6YfFVOHhLKOs5W83pDyYg==
X-Received: by 2002:a05:600c:1007:: with SMTP id
 c7mr42655946wmc.158.1578405823443; 
 Tue, 07 Jan 2020 06:03:43 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id w8sm28342018wmd.2.2020.01.07.06.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 06:03:42 -0800 (PST)
Date: Tue, 7 Jan 2020 14:03:41 +0000
From: Wei Liu <wl@xen.org>
To: "Xia, Hongyan" <hongyxia@amazon.com>
Message-ID: <20200107140341.ksogpysgedobibxo@debian>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
 <20200107121335.nqb3kx4eos3yfiwb@debian>
 <3a9b7abc-6898-968b-a202-446e5d8cdc41@suse.com>
 <021e7246d95a3f5a48d5d91a671d30dbba86d3c4.camel@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <021e7246d95a3f5a48d5d91a671d30dbba86d3c4.camel@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86: move some xen mm function
 declarations
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
Cc: "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDE6NDg6NDFQTSArMDAwMCwgWGlhLCBIb25neWFuIHdy
b3RlOgo+IE9uIFR1ZSwgMjAyMC0wMS0wNyBhdCAxNDowOSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPiAuLi4KPiA+IAo+ID4gTG9va3MgbGlrZSBJIHNpbXBseSBmb3Jnb3QgZXZlcnkgdGlt
ZSBJIHdlbnQgdGhyb3VnaCBteSBsaXN0IG9mCj4gPiBwZW5kaW5nIChmb3IgdGhlIHZhcmlvdXMg
c3RhZ2VzIG9mIHByb2Nlc3NpbmcpIHBhdGNoZXMuIEkgZ3Vlc3MKPiA+IHBhdGNoZXMgMyBhbmQg
NCBhcmUgYWxzbyBpbmRlcGVuZGVudCBvZiBwYXRjaCAyIGFuZCBoZW5jZSBjb3VsZAo+ID4gZ28g
aW4gYXMgd2VsbC4KPiAKPiBJZiBzbywgbG9va3MgbGlrZSBwYXRjaCA3LzcgaXMgYWxzbyBpbiBh
IGNvbW1pdHRhYmxlIHN0YXRlPwoKTG9va3MgbGlrZSBzby4gSSB3aWxsIGNvbW1pdCB0aGF0IG9u
ZSBhcyB3ZWxsLgoKVGhhbmtzIGZvciBwdXR0aW5nIGluIHRoZSBlZmZvcnQgdG8gdXBzdHJlYW0g
dGhlc2UgcGF0Y2hlcywgSG9uZ3lhbi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
