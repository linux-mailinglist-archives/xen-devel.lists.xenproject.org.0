Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A920DECEB2
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2019 13:31:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQsSI-0002kB-VC; Sat, 02 Nov 2019 12:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lik/=Y2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iQsSH-0002k6-G8
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2019 12:24:33 +0000
X-Inumbo-ID: b94c7dfa-fd6b-11e9-b7a7-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b94c7dfa-fd6b-11e9-b7a7-bc764e2007e4;
 Sat, 02 Nov 2019 12:24:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l10so12234481wrb.2
 for <xen-devel@lists.xenproject.org>; Sat, 02 Nov 2019 05:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RKrcDU7kWeb/ck2Rgmy1s/wA0Jv/KWhcZITFUFiqsvk=;
 b=VVidX+MB5BO07fBv56Untre+9aEzW9Ii3VWLgUN8OYjRVYlZUA9lBUPuGl55OTXudw
 oU3ndDEZ3w8hyW20maZr5wtwKwKBqL6IeIJ4udk/aebwTYk1sKlSZW0IDkVGTRCnPQW2
 jXn/LK7CJBBAUJwQe7VbWH4gn+yshX+li55vSsvNCgnleuOo9XvtATBWxFW9WQbUG7oB
 k2TE5N4V8H76c/J8Unid4KGdP8heecPMGxpcH5Kd8M0fptwa3+eQMHQ6HINP3P+ZlLzy
 t3AhVVnccDiDQ4GVCKUFVfv4OpfuTexzCIqLFB1GoYj6PSm4V3EC+XmHL115YAi0PhyC
 U/jw==
X-Gm-Message-State: APjAAAWHafoVImc4JHVuRRzdTNoDZFEAefGCp2kpLVFEsshCpJrLpC6l
 Iy/7ISMUE3Z7hAKJkRijZwY=
X-Google-Smtp-Source: APXvYqx1kNgf+LBEqgTuRE4sMrHvqk43PUDCqNs04FN7DJuN7CD+jz/y+rZYDQfDUmBDcAlUzTV/2A==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr14401873wru.162.1572697472016; 
 Sat, 02 Nov 2019 05:24:32 -0700 (PDT)
Received: from debian (61.163.200.146.dyn.plus.net. [146.200.163.61])
 by smtp.gmail.com with ESMTPSA id g5sm2039636wmf.37.2019.11.02.05.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 05:24:31 -0700 (PDT)
Date: Sat, 2 Nov 2019 12:24:29 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191102122429.mve6rdz2w3u3gieo@debian>
References: <20191101191355.32611-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101191355.32611-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] tools: Fix local variable block
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDc6MTM6NTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjLWluZGVudC1sZXZlbCBpc24ndCBjb25zaWRlcmVkIGEgc2FmZSB2YXJpYWJsZSwg
YW5kICJzb2xhcmlzIiBpc24ndCBhCj4gcmVjb2duaXNlZCBDIHN0eWxlLiAgQm90aCBjYXVzZSBw
cm9tcHRzIHdoZW4gb3BlbmluZyB0aGUgZmlsZXMuCj4gCj4gRml4IGFsbCBibG9ja3MgdXAgcGVy
IENPRElOR19TVFlMRQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
