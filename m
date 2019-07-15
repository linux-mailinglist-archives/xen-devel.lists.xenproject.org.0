Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22AE68F6C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:14:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1hQ-0002rJ-Tq; Mon, 15 Jul 2019 14:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cAUX=VM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hn1hP-0002rC-FQ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:11:27 +0000
X-Inumbo-ID: 6cef575a-a70a-11e9-bad3-673898a5e259
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cef575a-a70a-11e9-bad3-673898a5e259;
 Mon, 15 Jul 2019 14:11:23 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hqjyWRnlGa0+nN/Zh7yidJDrnsjYvnF4L7lwc1Xs5vA/OKS4xkWa4aUcEWpsabkk64P/0wk8pY
 yHzpaQvzImFJDky/NvPpJZsraqOkH9mJwBciD0EHSVmeB9f1hcPvN3G0OxPl4PaEf6z6KocNdx
 wm2/D7luO5a+cfYNK2ciREPLNkoj+mrqhxOGMt7DzO5aUQ0bKYHQDHWXj7W1uF7wkEQijFK256
 kUzJ1uL032A+AE5go0xU4B2vRPEpZFZmI0am4zvvAek2EdJ+uvh8BOOCQkedkNoSdB25VrTRLC
 wMs=
X-SBRS: 2.7
X-MesageID: 2983554
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2983554"
To: xen-devel <xen-devel@lists.xenproject.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwLkBDQRUWmc6AQgAzpc8Ng5Opbrh
 iZrn69Xr3js28p+b4a+0BOvC48NfrNovZw4eFeKIzmI/t6EkJkSqBIxobWRpBkwGweENsqnd
 0qigmsDw4N7J9Xx0h9ARDqiWxX4jr7u9xauI+CRJ1rBNO3VV30QdACwQ4LqhR/WA+IjdhyMH
 wj3EJGE61NdP/h0zfaLYAbvEg47/TPThFsm4m8Rd6bX7RkrrOgBbL/AOnYOMEivyfZZKX1vv
 iEemAvLfdk2lZt7Vm6X/fbKbV8tPUuZELzNedJvTTBS3/l1FVz9OUcLDeWhGEdlxqXH0sYWh
 E9+PXTAfz5JxKH+LMetwEM8DbuOoDIpmIGZKrZ+2fQARAQABiQNbBBgBCgAmAhsCFiEE16gc
 tm0zVz86TmBYpjY8MQWQtG0FAlxKMJ4FCQnQ/OQBKcBdIAQZAQoABgUCVFpnOgAKCRCyFcen
 x4Qb7cXrCAC0qQeEWmLa9oEAPa+5U6wvG1t/mi22gZN6uzQXH1faIOoDehr7PPESE6tuR/vI
 CTTnaSrd4UDPNeqOqVF07YexWD1LDcQG6PnRqC5DIX1RGE3BaSaMl2pFJP8y+chews11yP8G
 DBbxaIsTcHZI1iVIC9XLhoeegWi84vYc8F4ziADVfowbmbvcVw11gE8tmALCwTeBeZVteXjh
 0OELHwrc1/4j4yvENjIXRO+QLIgk43kB57Upr4tP2MEcs0odgPM+Q+oETOJ00xzLgkTnLPim
 C1FIW2bOZdTj+Uq6ezRS2LKsNmW+PRRvNyA5ojEbA/faxmAjMZtLdSSSeFK8y4SoCRCmNjwx
 BZC0bevWEACRu+GyQgrdGmorUptniIeO1jQlpTiP5WpVnk9Oe8SiLoXUhXXNj6EtzyLGpYmf
 kEAbki+S6WAKnzZd3shL58AuMyDxtFNNjNeKJOcl6FL7JPBIIgIp3wR401Ep+/s5pl3Nw8Ii
 157f0T7o8CPb54w6S1WsMkU78WzTxIs/1lLblSMcvyz1Jq64g4OqiWI85JfkzPLlloVf1rzy
 ebIBLrrmjhCE2tL1RONpE/KRVb+Q+PIs5+YcZ+Q1e0vXWA7NhTWFbWx3+N6WW6gaGpbFbopo
 FkYRpj+2TA5cX5zW148/xU5/ATEb5vdUkFLUFVy5YNUSyeBHuaf6fGmBrDc47rQjAOt1rmyD
 56MUBHpLUbvA6NkPezb7T6bQpupyzGRkMUmSwHiLyQNJQhVe+9NiJJvtEE3jol0JVJoQ9WVn
 FAzPNCgHQyvbsIF3gYkCYKI0w8EhEoH5FHYLoKS6Jg880IY5rXzoAEfPvLXegy6mhYl+mNVN
 QUBD4h9XtOvcdzR559lZuC0Ksy7Xqw3BMolmKsRO3gWKhXSna3zKl4UuheyZtubVWoNWP/bn
 vbyiYnLwuiKDfNAinEWERC8nPKlv3PkZw5d3t46F1Dx0TMf16NmP+azsRpnMZyzpY8BL2eur
 feSGAOB9qjZNyzbo5nEKHldKWCKE7Ye0EPEjECS1gjKDwbkBDQRUWrq9AQgA7aJ0i1pQSmUR
 6ZXZD2YEDxia2ByR0uZoTS7N0NYv1OjU8v6p017u0Fco5+Qoju/fZ97ScHhp5xGVAk5kxZBF
 DT4ovJd0nIeSr3bbWwfNzGx1waztfdzXt6n3MBKr7AhioB1m+vuk31redUdnhbtvN7O40MC+
 fgSk5/+jRGxY3IOVPooQKzUO7M51GoOg4wl9ia3H2EzOoGhN2vpTbT8qCcL92ZZZwkBRldoA
 Wn7c1hEKSTuT3f1VpSmhjnX0J4uvKZ1V2R7rooKJYFBcySC0wa8aTmAtAvLgfcpe+legOtgq
 DKzLuN45xzEjyjCiI521t8zxNMPJY9FiCPNv0sCkDwARAQABiQI8BBgBCgAmAhsMFiEE16gc
 tm0zVz86TmBYpjY8MQWQtG0FAlxKNJYFCQnQrVkACgkQpjY8MQWQtG2Xxg//RrRP+PFYuNXt
 9C5hec/JoY24TkGPPd2tMC9usWZVImIk7VlHlAeqHeE0lWU0LRGIvOBITbS9izw6fOVQBvCA
 Fni56S12fKLusWgWhgu03toT9ZGxZ9W22yfw5uThSHQ4y09wRWAIYvhJsKnPGGC2KDxFvtz5
 4pYYNe8Icy4bwsxcgbaSFaRh+mYtts6wE9VzyJvyfTqbe8VrvE+3InG5rrlNn51AO6M4Wv20
 iFEgYanJXfhicl0WCQrHyTLfdB5p1w+072CL8uryHQVfD0FcDe+J/wl3bmYze+aD1SlPzFoI
 MaSIXKejC6oh6DAT4rvU8kMAbX90T834Mvbc3jplaWorNJEwjAH/r+v877AI9Vsmptis+rni
 JwUissjRbcdlkKBisoUZRPmxQeUifxUpqgulZcYwbEC/a49+WvbaYUriaDLHzg9xisijHwD2
 yWV8igBeg+cmwnk0mPz8tIVvwi4lICAgXob7HZiaqKnwaDXs4LiS4vdG5s/ElnE3rIc87yru
 24n3ypeDZ6f5LkdqL1UNp5/0Aqbr3EiN7/ina4YVyscy9754l944kyHnnMRLVykg0v+kakj0
 h0RJ5LbfLAMM8M52KIA3y14g0Fb7kHLcOUMVcgfQ3PrN6chtC+5l6ouDIlSLR3toxH8Aam7E
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
Date: Mon, 15 Jul 2019 15:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Design session report: Xen on Distros
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TXVjaCBvZiB0aGlzIGNvdmVyZWQgdGhpbmdzIGRpc2N1c3NlZCBlbHNld2hlcmU6CiogQWxsb3dp
bmcgbXVsdGlwbGUgdmVyc2lvbnMgb2YgdGhlIHRvb2xzIHRvIGJlIGluc3RhbGxlZCBhdCB0aGUg
c2FtZSB0aW1lCiogR2V0dGluZyByaWQgb2YgZXh0ZXJuYWwgYnVpbGRzCgpUaGVyZSB3YXMgYSBs
b25nIGRpc2N1c3Npb24gYWJvdXQgc2VjdXJpdHkgcGF0Y2hlcywgd2l0aCB0aGUgZ2VuZXJhbApw
cm9wb3NhbCBiZWluZyB0aGF0IHdlIHNob3VsZCBjdXQgYSBwb2ludCByZWxlYXNlIGZvciBldmVy
eSBzZWN1cml0eSBpc3N1ZS4KCk9uZSByYW5kb20gdGhpbmcgd2FzIHRoYXQgeGVuc3RvcmVkIGFw
cGFyZW50bHkgaGFzIGFuICdpbi1tZW1vcnktb25seScKb3B0aW9uLiAgU2luY2UgeGVuc3RvcmVk
IGNhbid0IGFjdHVhbGx5IGJlIHJlc3RhcnRlZCBBVE0sIGFuZCBtb3N0CmRpc3Ryb3Mgc2VlbWVk
IHRvIHB1dCB4ZW5zdG9yZWQgaW4gYSB0bXBmcyBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucywgdGhp
cwpzaG91bGQgcHJvYmFibHkgYmUgdGhlIGRlZmF1bHQuCgpodHRwczovL2hhY2ttZC5pby92bWFj
VkJZYlFpT1JKOUg0X2E5SXZ3CgojIFhlbiBvbiBEaXN0cm9zIGRlc2lnbiBzZXNzaW9uCgoqIHFl
bXUgLyBsaWJ4YyBkZXBlbmRlbmN5IGxvb3AKKiBidWlsZCBzeXN0ZW0gbmVlZHMgImV4dHJhcyIg
dHVybmVkIG9mZgoqIHhlbnN0b3JlZCAvIHRtcGZzIC8gbWVtb3J5LW9ubHkgb3B0aW9uPwoqIERp
c2FibGluZyBhdXRvLWRvd25sb2FkIGluIGJ1aWxkIHN5c3RlbQogICAgKiBXR0VUPS9iaW4vZmFs
c2UKKiBNdWx0aXBsZSB2ZXJzaW9uIG9mIFhlbiAvIHRvb2xzPwogICAgKiBEZWJpYW4gaGFzIGNv
LWluc3RhbGwKICAgICAgICAqIENoYW5nZSBzb21lIGluc3RhbGxhdGlvbiBwYXRocwogICAgICAg
ICogL3Vzci9saWIveGVuLzQuMTEvLi4uCiAgICAgICAgKiAvdXNyL2Jpbi94bCBpcyBhIHNoZWxs
IHNjcmlwdAogICAgICAgICogbGliZnNpbWFnZSBpcyBzcGVjaWFsCiAgICAgICAgKiBEb24ndCBu
ZWVkIHRvIGRvd25ncmFkZSB0byBvbGRlciB0b29scwogICAgKiBHZW50b28gaGFzIGEgfn5kdW1w
c3RlciBmaXJlfn4gc29tZXRoaW5nCiAgICAgICAgKiBBIGhhY2sgd2hpY2ggc3RvcHMgdGhlIHBh
Y2thZ2UgbWFuYWdlciB0byBhbGxvdyB5b3UgdG8gcmVib290CnRoZSBib3ggaGFsZndheSB0aHJv
dWdoCiogU2VjdXJpdHkgaXNzdWVzCiAgICAqIEJ1aWxkaW5nIGZyb20gc3RhYmxlIGJyYW5jaCAv
IHN0YWdpbmcgYnJhbmNoCiAgICAqIERvaW5nIGEgInBvaW50IHJlbGVhc2UiIGV2ZXJ5IFhTQT8K
ICAgICogIlJlbGVhc2UgZnJvbSBzdGFnaW5nIiBpcyBlZmZlY3RpdmVseSBhIGxvdy1xdWFsaXR5
IHJlbGVhc2UKICAgICogSWRlYTogQWx3YXlzIGltbWVkaWF0ZWx5IHJlbGVhc2UgZnJvbSBzdGFn
aW5nPwoKCiMgQWN0aW9ucwoqIFsgXSBJYW46IFBvc3QgYSBnaXQgYnJhbmNoIG9mIERlYmlhbiBj
by1pbnN0YWxsIHRvIHhlbi1kZXZlbAoqIFsgXSBHZW9yZ2U6IFBvc3Qgc3lzdGVtZCAvIHNlbGlu
dXggLyB4ZW5zdG9yZWQgcGF0Y2gKKiBbIF0gR2VvcmdlLCBJYW46IHByaXZhdGUgb3NzdGVzdCBy
dW5zCiogWyBdIFZPTFVOVEVFUjogUHJvcG9zZSAvIGFyZ3VlIGZvciBhIHBvaW50IHJlbGVhc2Ug
cGVyIFhTQQoqIFsgXSBWT0xVTlRFRVI6IEltcHJvdmUgcmVsZWFzZSBhdXRvbWF0aW9uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
