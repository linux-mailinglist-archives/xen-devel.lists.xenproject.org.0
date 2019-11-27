Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028310AD69
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 11:16:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZuLQ-0004Sy-EK; Wed, 27 Nov 2019 10:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mal6=ZT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZuLO-0004Ss-Bq
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 10:14:46 +0000
X-Inumbo-ID: bc4150d4-10fe-11ea-a55d-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4150d4-10fe-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 10:14:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so1345794wrn.7
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 02:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F5lyz9tGbAf7enIrYNariXcaSbkdGQyfyyJhlUCcuc8=;
 b=gh1LNGhRUor+iek34xniBsUBeOOB6GhPEsw5+tcKHJKEa8jTDZibsrXzwWZRcCpSux
 GdhMlxo2Pez17fTKX6oCxdhpNuxgN75Qp0UPMHSFsRuCEG187VRhsIld/kePdaJoo/b8
 5+aPbN2ZVIVZy4vvxTwYNS8wQQ1bt5wFQuHVJJjJXM6szhFwKfz3f3nuaNT6gh0zuO1F
 J+NudWaZBOdQQB2g5FTd66NktOnWjjKvdFKYRCEYryDcMrYUbrxiM4G9pelkl5yVpEah
 XiFaWSzFAHhsFcz/thIumem5BoVw2Um9mDYt5424XRhX+TWX6jeoc4y2BtE+nheK2z2t
 +lfA==
X-Gm-Message-State: APjAAAXS4Irobjz1iQksXTh4iwy8VE+sE4NTjWafzhwMwSDBfON/fdv5
 9omeOcnaO/RZCZusGvH5TsBKNQDOUDQ=
X-Google-Smtp-Source: APXvYqwfTXujQwTeBqVpZBhNQRKrst3X0D2YrX0JxnEoMmCtykz0xmI2j5B1Kks39CVndGT9cVH1gA==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr24482102wrn.128.1574849685148; 
 Wed, 27 Nov 2019 02:14:45 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id r15sm19210823wrc.5.2019.11.27.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 02:14:44 -0800 (PST)
Date: Wed, 27 Nov 2019 10:14:43 +0000
From: Wei Liu <wl@xen.org>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20191127101443.ret3tazvqaubm54d@debian>
References: <20191126154920.2950420-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126154920.2950420-1-george.dunlap@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] docs/xl: Document
 pci-assignable state
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
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6NDk6MjBQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBDaGFuZ2VzZXRzIDMxOWY5YTBiYTkgKCJwYXNzdGhyb3VnaDogcXVhcmFudGluZSBQ
Q0kgZGV2aWNlcyIpIGFuZAo+IGJhMmFiMDBiYmIgKCJJT01NVTogZGVmYXVsdCB0byBhbHdheXMg
cXVhcmFudGluaW5nIFBDSSBkZXZpY2VzIikKPiBpbnRyb2R1Y2VkIFBDSSBkZXZpY2UgInF1YXJh
bnRpbmUiIGJlaGF2aW9yLCBidXQgZGlkIG5vdCBkb2N1bWVudCBob3cKPiB0aGUgcGNpLWFzc2ln
bmFibGUtYWRkIGFuZCAtcmVtb3ZlIGZ1bmN0aW9ucyBhY3QgaW4gcmVnYXJkIHRvIHRoaXMuCj4g
UmVjdGlmeSB0aGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4KPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgpPbmNlIGFnYWluOgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CgpJIHdpbGwgd2FpdCBhIGJpdCBiZWZvcmUgcHVzaGluZyBzbyB0aGF0IFBhdWwgaGFzIGEgY2hh
bmNlIHRvIGNvbW1lbnQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
