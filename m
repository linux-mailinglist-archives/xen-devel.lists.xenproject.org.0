Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D9C1015
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 09:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE7Eu-0005Ej-Tc; Sat, 28 Sep 2019 07:34:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S27p=XX=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1iE7Et-0005Ee-BS
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 07:33:59 +0000
X-Inumbo-ID: 54ab280c-e1c2-11e9-b588-bc764e2007e4
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.156.1])
 by localhost (Halon) with ESMTPS
 id 54ab280c-e1c2-11e9-b588-bc764e2007e4;
 Sat, 28 Sep 2019 07:33:57 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8S7X0Nn023507
 for <xen-devel@lists.xenproject.org>; Sat, 28 Sep 2019 03:33:56 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2va2u2rdh8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 28 Sep 2019 03:33:56 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Sat, 28 Sep 2019 08:33:52 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 28 Sep 2019 08:33:39 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8S7XdOa53280776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 28 Sep 2019 07:33:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA026AE051;
 Sat, 28 Sep 2019 07:33:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CE5CAE045;
 Sat, 28 Sep 2019 07:33:34 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.204.50])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 28 Sep 2019 07:33:34 +0000 (GMT)
Date: Sat, 28 Sep 2019 10:33:32 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Adam Ford <aford173@gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19092807-0016-0000-0000-000002B189F7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092807-0017-0000-0000-000033125EFB
Message-Id: <20190928073331.GA5269@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909280079
Subject: Re: [Xen-devel] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDI6MzU6NTNQTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3Rl
Ogo+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDExOjA0IEFNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gT24gVGh1LCBTZXAgMjYs
IDIwMTkgYXQgMDg6MDk6NTJBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gPiBPbiBXZWQs
IFNlcCAyNSwgMjAxOSBhdCAxMDoxNyBBTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBB
TSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+
IEkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBkdW1wIGF0IHRoZSBiZWdpbm5p
bmcgZGlkbid0Cj4gPiA+ID4gPiBjaGFuZ2UuICBEbyB3ZSBuZWVkIHRvIHNldHVwIGEgcmVzZXJ2
ZWQtbWVtb3J5IG5vZGUgbGlrZQo+ID4gPiA+ID4gaW14NnVsLWNjaW14NnVsc29tLmR0c2kgZGlk
Pwo+ID4gPiA+Cj4gPiA+ID4gSSBkb24ndCB0aGluayBzby4KPiA+ID4gPgo+ID4gPiA+IFdlcmUg
eW91IGFibGUgdG8gaWRlbnRpZnkgd2hhdCB3YXMgdGhlIGV4YWN0IGNvbW1pdCB0aGF0IGNhdXNl
ZCBzdWNoIHJlZ3Jlc3Npb24/Cj4gPiA+Cj4gPiA+IEkgd2FzIGFibGUgdG8gbmFycm93IGl0IGRv
d24gdGhlIDkyZDEyZjk1NDRiNyAoIm1lbWJsb2NrOiByZWZhY3Rvcgo+ID4gPiBpbnRlcm5hbCBh
bGxvY2F0aW9uIGZ1bmN0aW9ucyIpIHRoYXQgY2F1c2VkIHRoZSByZWdyZXNzaW9uIHdpdGgKPiA+
ID4gRXRuYXZpdi4KPiA+Cj4gPgo+ID4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB3aXRoIHRoaXMgY2hh
bmdlOgo+ID4KPiAKPiBUaGF0IGFwcGVhcnMgdG8gaGF2ZSBmaXhlZCBteSBpc3N1ZS4gIEkgYW0g
bm90IHN1cmUgd2hhdCB0aGUgaW1wYWN0Cj4gaXMsIGJ1dCBpcyB0aGlzIGEgc2FmZSBvcHRpb24/
CgpJdCdzIG5vdCByZWFsbHkgYSBmaXgsIEkganVzdCB3YW50ZWQgdG8gc2VlIGhvdyBleGFjdGx5
IDkyZDEyZjk1NDRiNyAoIm1lbWJsb2NrOgpyZWZhY3RvciBpbnRlcm5hbCBhbGxvY2F0aW9uIGZ1
bmN0aW9ucyIpIGJyb2tlIHlvdXIgc2V0dXAuCgpDYW4geW91IHNoYXJlIHRoZSBkdHMgeW91IGFy
ZSB1c2luZyBhbmQgdGhlIGZ1bGwga2VybmVsIGxvZz8KIAo+IGFkYW0KPiAKPiA+IGRpZmYgLS1n
aXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwo+ID4gaW5kZXggN2Q0ZjYxYS4uMWY1
YTBlYiAxMDA2NDQKPiA+IC0tLSBhL21tL21lbWJsb2NrLmMKPiA+ICsrKyBiL21tL21lbWJsb2Nr
LmMKPiA+IEBAIC0xMzU2LDkgKzEzNTYsNiBAQCBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1l
bWJsb2NrX2FsbG9jX3JhbmdlX25pZChwaHlzX2FkZHJfdCBzaXplLAo+ID4gICAgICAgICAgICAg
ICAgIGFsaWduID0gU01QX0NBQ0hFX0JZVEVTOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gLSAgICAg
ICBpZiAoZW5kID4gbWVtYmxvY2suY3VycmVudF9saW1pdCkKPiA+IC0gICAgICAgICAgICAgICBl
bmQgPSBtZW1ibG9jay5jdXJyZW50X2xpbWl0Owo+ID4gLQo+ID4gIGFnYWluOgo+ID4gICAgICAg
ICBmb3VuZCA9IG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2Vfbm9kZShzaXplLCBhbGlnbiwgc3RhcnQs
IGVuZCwgbmlkLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmbGFncyk7Cj4gPgo+ID4gPiBJIGFsc28gbm90aWNlZCB0aGF0IGlmIEkgY3JlYXRlIGEgcmVz
ZXJ2ZWQgbWVtb3J5IG5vZGUgYXMgd2FzIGRvbmUgb25lCj4gPiA+IGlteDZ1bC1jY2lteDZ1bHNv
bS5kdHNpIHRoZSAzRCBzZWVtcyB0byB3b3JrIGFnYWluLCBidXQgd2l0aG91dCBpdCwgSQo+ID4g
PiB3YXMgZ2V0dGluZyBlcnJvcnMgcmVnYXJkbGVzcyBvZiB0aGUgJ2NtYT0yNTZNJyBvciBub3Qu
Cj4gPiA+IEkgZG9uJ3QgaGF2ZSBhIHByb2JsZW0gdXNpbmcgdGhlIHJlc2VydmVkIG1lbW9yeSwg
YnV0IEkgZ3Vlc3MgSSBhbSBub3QKPiA+ID4gc3VyZSB3aGF0IHRoZSBhbW91bnQgc2hvdWxkIGJl
LiAgSSBrbm93IGZvciB0aGUgdmlkZW8gZGVjb2RpbmcgMTA4MHAsCj4gPiA+IEkgaGF2ZSBoaXN0
b3JpY2FsbHkgdXNlZCBjbWE9MTI4TSwgYnV0IHdpdGggdGhlIDNEIGFsc28gbmVlZGluZyBzb21l
Cj4gPiA+IG1lbW9yeSBhbGxvY2F0aW9uLCBpcyB0aGF0IGVub3VnaCBvciBzaG91bGQgSSB1c2Ug
MjU2TT8KPiA+ID4KPiA+ID4gYWRhbQo+ID4KPiA+IC0tCj4gPiBTaW5jZXJlbHkgeW91cnMsCj4g
PiBNaWtlLgo+ID4KCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
