Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3D665F2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 06:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlnWc-0007AK-Ek; Fri, 12 Jul 2019 04:51:14 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.108])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <BATV+bd3a2e70cf273da75738+5801+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1hlnWa-0007AF-Qt
 for xen-devel@lists.xensource.com; Fri, 12 Jul 2019 04:51:13 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-west-1.aws.symcld.net id D8/5C-10882-FB1182D5;
 Fri, 12 Jul 2019 04:51:11 +0000
Authentication-Results: mx.messagelabs.com; spf=none (spf record not 
 found) smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (good 
 signature) header.i=@infradead.org header.s=bombadil.20170209; 
 dmarc=none (no record) header.from=infradead.org
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsVyrPNUq+5OQY1
 Yg8/dGhb3prxnd2D02N63iz2AMYo1My8pvyKBNWPpuZmMBbvdKw5ensfewPjMuYuRi4NF4ASb
 xPmDy1hBHCGB04wST7YtYexi5OTgFfCSeHHtIjuILSzgKHFj+0ewOJuAtsSBHSdZQBpEBNYxS
 rw7tZYNxGEW6GaWWP15ClgHi4CqxKlnv1lAbE4Bf4ktx1qYIVYsZJFYe38vE0iCWaBeYsqVW2
 C2hICOxNtTfUANHECrBSX+7hAGqZcQaGOUeLnyH8sERr5ZSFpmIZRBhDUlWrf/ZoewtSWWLXz
 NDGHbSuy/uhLKNpV4ffQjI4StKDGl+yH7Akb2VYwWSUWZ6RkluYmZObqGBga6hoZGuoaW5kBs
 rJdYpZukl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGPQpBUcP7mDsn/VG7xCjJAeTkijvZ
 D71WCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvJ0CGrFCgkWp6akVaZk5wAiESUtw8CiJ8N7iB0
 rzFhck5hZnpkOkTjEqSonzloAkBEASGaV5cG2wqL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnIN
 RSZj3C8gUnsy8Erjpr4AWMwEtVvVTA1lckoiQkmpgEi74kfL+U3D9r4PGDd8fqc9mrhLUbGDW
 +1/ufnTGD2v7KMNetxV1AT1L+r/KSy2t4E0xlxHzSruo9sj7hEzIpyKhho5wBlGf/xW8H7dON
 /I71jpPIjhPKK4g92HJEsfw/R/t+GXTDp79fiv44YMIR9Ewe7sf1ztMH0cq+rw28m2LkjRLSv
 0V6VlebTvFcuVl5f8Xu36H9bnvvmC7Qu7Z9kqJos9c2kF7b9/3e7JW/IjUCc/fd6Wra/iYp7z
 x5GQSPSt4XcBfoMCau/tx/LfUdarn2K+frOEr8Xx3vsbxUtGHvOZop8XWpTd2+r/PX3l/TUnq
 m/CKw6fUSl/9PxF3JpgjPqc8zYwrpzrhrRJLcUaioRZzUXEiAAX0rX91AwAA
X-Env-Sender: BATV+bd3a2e70cf273da75738+5801+infradead.org+dwmw2@bombadil
 .srs.infradead.org
X-Msg-Ref: server-14.tower-284.messagelabs.com!1562907058!1061880!1
X-Originating-IP: [198.137.202.133]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14546 invoked from network); 12 Jul 2019 04:51:00 -0000
Received: from bombadil.infradead.org (HELO bombadil.infradead.org)
 (198.137.202.133)
 by server-14.tower-284.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2019 04:51:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdox2ZfZGVp8RPxdn45Hz7Pn5ApsjHM3bUxeDl48jOA=; b=GPgkIzMW5sZc0SGXX7ZjiGsfX
 OQwNCpMP6R/CVzSrxiOAtuMrRCkPkWWFG3eExHMsLmkeMf1JSXffpAcJIhxYU1bkmN9U1O/SDTezx
 gXElPqr+WVJS7pZgJ2vk1K3NjE5YD5hH/N4NfuNSW2TSpzyJabpFfqOPK/iCv0JmuaK2G8L0DwHVS
 jlCkLg+3hcdtzFTrs9+yWVcyxF/f852mtfe/BpfT+dr05dssmcBItxNsZxwhhNmjPvG3aAzqGm2A/
 RX9zo5Nq/HXcxKmaiBRMy9b14QOLjyv0lEKPZO1EvXhL2se4MiGUuTNHnBB6s3ll+VHjw14KjC1YU
 +kcaisOuQ==;
Received: from 72-21-196-67.amazon.com ([72.21.196.67] helo=freeip.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hlnWG-0005zH-V4; Fri, 12 Jul 2019 04:50:53 +0000
Message-ID: <e296b35081171fa5f6d64e53e9fbb91e0b9e7d77.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Adam Williamson <adamwill@fedoraproject.org>, Peter Robinson
 <pbrobinson@gmail.com>, For testing and quality assurance of Fedora
 releases <test@lists.fedoraproject.org>
Date: Thu, 11 Jul 2019 23:50:50 -0500
In-Reply-To: <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: xen-devel@lists.xensource.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Committers <committers@xenproject.org>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============8392023025070828656=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8392023025070828656==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-7vRuQzrnalOZ4rdv36n9"


--=-7vRuQzrnalOZ4rdv36n9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-11 at 14:19 -0700, Adam Williamson wrote:
> Yeah, that's where I was going to go next (there has already been a
> thread about this this morning). If what we care about is that Fedora
> boots on EC2, that's what we should have in the criteria, and what we
> should test.

While trying hard to avoid a "haha he would say that" response, I do
genuinely believe that's a reasonable canary and could cover most of
the use cases that various users even outside EC2 would care about.

> IIRC, what we have right now is a somewhat vague setup where we just
> have 'local', 'ec2' and 'openstack' columns. The instructions for
> "Amazon Web Services" just say "Launch an instance with the AMI under
> test". So we could probably stand to tighten that up a bit, and define
> specific instance type(s) that we want to test/block on.

I think we can define a set of instance types that would cover what it
makes sense to test. Do we still care about actual PV guests or only
HVM? I think it makes sense to test guests with Xen netback and blkback
rather than only ENA and NVMe, but Fedora probably wants to test the
latter two *anyway*.

Do we want to do this by making sure you have free credits to run the
appropriate tests directly... or is it better all round for us to just
do this on nightly builds for ourselves?

The latter brings me to a question that's been bugging me for a while =E2=
=80=94
how in $DEITY's name *do* I launch the latest official Fedora AMI
anyway? I can't find it through the normal GUI launch process and have
to go to getfedora.org and click around for a while because I find the
specific AMI ID for the that region, and then manually enter that to
launch the instance. Can't we fix that so I can just select 'Fedora 30'
with a single click? Whose heads do I have to bash together to make
that work?



--=-7vRuQzrnalOZ4rdv36n9
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkw
NzEyMDQ1MDUwWjAvBgkqhkiG9w0BCQQxIgQgD0qjCX3++jFEKEs1IdOt1EUJllNZ1ydzvcNBd3+W
vk4wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAE0keL8Kpa/RpgdfvoreDxAdbbpospL0+6UDx+vYt8h3hgGBiuYjdf6HhUtXQ7Cu
FuU6EIpo1hpw5RAvphqgJgmc1zcBZudv3Lxefhlj0CiRLk5XZtaqFFku6zu5gKY4bwZp3JywkTt0
tNkXzQNVR9UjN56qbxdKvwKOGzBpaEHH4DGVu3LMGXN5FwFfpiES5S/zw+AcSnF8Nx9NRV7hE8G+
qSY0+vEetIMoGrl7V1YTj36IZDGj4IdydRJF9kpj0bE/4dLSfC/vmfxk9kyOtZR6M4hQwbXQ6Wtg
COkJpkHoCGZ0+C2oFWn1B9BXWO6gq5YtX+jGLtNoYaeDwkY8X5IAAAAAAAA=


--=-7vRuQzrnalOZ4rdv36n9--



--===============8392023025070828656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8392023025070828656==--


