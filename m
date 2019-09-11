Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59FCAFBFC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:57:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i81Ch-0000Kp-5F; Wed, 11 Sep 2019 11:54:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i81Cf-0000Kg-N6
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:54:29 +0000
X-Inumbo-ID: e81972e6-d48a-11e9-ac29-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e81972e6-d48a-11e9-ac29-12813bfff9fa;
 Wed, 11 Sep 2019 11:54:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45AEDB68C;
 Wed, 11 Sep 2019 11:54:27 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
 <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
Date: Wed, 11 Sep 2019 13:54:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAxMzoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wOS4xOSAx
MzoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gU2Vjb25kLCBpcyB4ZW5mcyByZWFsbHkgdGhl
IGJlc3QgbmFtZSBoZXJlP8KgIEl0IGlzIGFtYmlndW91cyB3aXRoIHRoZQo+PiBzdGlsbC1lc3Nl
bnRpYWwgKGV2ZW4gdGhvdWdoIGl0IHJlYWxseSBuZWVkcyB0byBkaXNhcHBlYXIpIExpbnV4Cj4+
IGZpbGVzeXN0ZW0gYnkgdGhlIG5hbWUgeGVuZnMuCj4gCj4gWWVzLCBJJ20gYXdhcmUgb2YgdGhh
dCBhbWJpZ3VpdHkuIEknbSBhYnNvbHV0ZWx5IGluIGZhdm9yIG9mIGZpbmRpbmcgYQo+IGJldHRl
ciBuYW1lLgo+IAo+IE1heWJlIHhlbnN5c2ZzPwoKT3IganVzdCB4ZW5zeXMgKGFsYmVpdCB0aGF0
J3MgbGlrZWx5IGdldHRpbmcgYW1iaWd1b3VzKT8gSSdtCm5vdCBmdWxseSBjb252aW5jZWQgY2Fs
bGluZyB0aGlzIGEgZmlsZSBzeXN0ZW0gaXMgYSBnb29kIGlkZWEuCldpbmRvd3MnIG5hbWUtdmFs
dWUgcGFpciBzdG9yZSBpcyBjYWxsZWQgcmVnaXN0cnksIGZvcgpleGFtcGxlLCBkZXNwaXRlIGl0
IGFsc28gcmVzZW1ibGluZyBhIGZpbGUgc3lzdGVtIHRvIGEgY2VydGFpbgpkZWdyZWUuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
