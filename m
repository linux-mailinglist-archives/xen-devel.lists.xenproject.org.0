Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2A132614
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:22:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionpk-0006nB-VI; Tue, 07 Jan 2020 12:19:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ionpj-0006n6-Qq
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:19:39 +0000
X-Inumbo-ID: f982a268-3147-11ea-abed-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f982a268-3147-11ea-abed-12813bfff9fa;
 Tue, 07 Jan 2020 12:19:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so53716764wrh.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 04:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vCYWTQxFHRtPK975OBfNFnOiJ3nlwGbKY/hqjrTPB0k=;
 b=PAmVraAoSVxvvTexnqDHYd6LNwRTOh2Fxb6oAOShiyL/O0TNdtWtcfd9VQtfXLglZG
 J9JCZCcP3NJZmZLSNDTwA/NZH1ROOV0VBm6GqFxgpuwVcmFSQq8I/ksb0uUChbSfYZTL
 9YnjwDWd9P6vZyUFanDfmFuESXPjExGKF8V3x/7AVDH+9Gl28GEd9vO9ICtXyCvbirr7
 p2dyilB/JwxTZ6m6S7QQ9SesOhOIDB7DmQkG+HqyZWbIl0HcdsNOwSVoJzm94nEAiKS3
 y6HW7l4ngiY7Khg2iVpUghUe8R8+0TeBgecFylS8WnmgwJXrHE5dby3nS368X7/ai6av
 148A==
X-Gm-Message-State: APjAAAVsfz9R5tX7R7INc/BJvdihdae3FWFCyLkD2f1aPElXoHsRpFzS
 yK0dwePuu0uDpX8F5UwLKaw=
X-Google-Smtp-Source: APXvYqxvtXuVvHfBdoOmv9c7m+NlhuYrReqZU/dbampgSy/gKlEXT44k9rkU7ti/RvnDptnB/OQKzQ==
X-Received: by 2002:adf:ea42:: with SMTP id j2mr109246822wrn.270.1578399578368; 
 Tue, 07 Jan 2020 04:19:38 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id b10sm78951050wrt.90.2020.01.07.04.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:19:37 -0800 (PST)
Date: Tue, 7 Jan 2020 12:19:36 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200107121936.q3cyziecxnzsbstu@debian>
References: <20200106170352.28582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106170352.28582-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/save: Drop unused parameters from
 xc_domain_save()
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMDU6MDM6NTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBYQ0ZMQUdTX0NIRUNLUE9JTlRfQ09NUFJFU1MgaGFzIGJlZW4gdW51c2VkIHNpbmNl
IGMvcyBiMTViYzQzNDUgKDIwMTUpLAo+IFhDRkxBR1NfSFZNIHNpbmNlIGMvcyA5ZTg2NzJmMWMg
KDIwMTMpLCBhbmQgWENGTEFHU19TVERWR0Egc2luY2UgYy9zCj4gMDg3ZDQzMzI2ICgyMDA3KS4g
IERyb3AgdGhlIGNvbnN0YW50cywgYW5kIGNvZGUgd2hpY2ggc2V0cyB0aGVtLgo+IAo+IFRoZSBz
ZXBhcmF0ZSBodm0gcGFyYW1ldGVyIChhcHBlYXJlZCBpbiBjL3MgZDExYmVjOGExLCAyMDA3IGFu
ZCB1bHRpbWF0ZWx5Cj4gcmVkdW5kYW50IHdpdGggWENGTEFHU19IVk0pLCBpcyB1c2VkIGZvciBz
YW5pdHkgY2hlY2tpbmcgYW5kIGRlYnVnIHByaW50aW5nLAo+IHRoZW4gZGlzY2FyZGVkIGFuZCBy
ZXBsYWNlZCB3aXRoIFhlbidzIGlkZWEgb2Ygd2hldGhlciB0aGUgZG9tYWluIGlzIFBWIG9yCj4g
SFZNLgo+IAo+IFJlYXJyYW5nZSB0aGUgbG9naWMgaW4geGNfZG9tYWluX3NhdmUoKSB0byBhc2sg
WGVuIHNpZ2h0bHkgZWFybGllciwgYW5kIHVzZSBhCj4gY29uc2lzdGVudCBpZGVhIG9mICdodm0n
IHRocm91Z2hvdXQuICBSZW1vdmluZyB0aGlzIHBhcmFtZXRlciByZW1vdmVzIHRoZQo+IGZpbmFs
IHVzZXIgb2YgbGlieGwncyBkc3MtPmh2bSwgc28gZHJvcCB0aGF0IGZpZWxkIGFzIHdlbGwuCj4g
Cj4gVXBkYXRlIHRoZSBkb3h5Z2VuIGNvbW1lbnQgdG8gYmUgYWNjdXJhdGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2Vk
LWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
