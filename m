Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5518A22F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 19:15:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEdBu-0001oR-CI; Wed, 18 Mar 2020 18:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jgO6=5D=merlin.srs.infradead.org=batv+d4892f1aa55f88a4dca2+6051+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1jEdBs-0001oM-Ei
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 18:13:16 +0000
X-Inumbo-ID: 1c006742-6944-11ea-92cf-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c006742-6944-11ea-92cf-bc764e2007e4;
 Wed, 18 Mar 2020 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o3UQw2WqQBcI0lj1evxcpSk4EbNLOLStuFID0x5iGTE=; b=xnKvVeyYbbhArT6oS2GiZ94gbq
 QVZNWkPAY0Xt7JiuBWJtre1IC3JodjFINouuujrxO6KGgZLWXcLIadArACSA9Nuilxb7lNLBBjmLA
 gmEmiINW5zeLf6glSYGMEErUOZJ8BKdU9ZE3qY/IC4fYZx2xacfsQfJtzbaJyHdH/0BPbARsP4MEZ
 2C96gtVeA58xGHWhzlFCW7HBshdJ5Q7nfJTA6feKFDoC38YwQhQ42DFaRYFrxAkbSdRY8ZPsWbvIj
 4xm41GYfzSVfvEfRa/wVK0Kug/CQ3kON9M5M+QAhSCc9YDkb9J3rhGXM7Qw/4G2EtcxQdrHxQZDOG
 avlHUNqg==;
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=edge-m1-r3-134.e-iad16.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEdBZ-0000xf-S2; Wed, 18 Mar 2020 18:12:58 +0000
Message-ID: <d32839020e3914569a6ac20b7f837b88a100202a.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Ian Jackson <ian.jackson@citrix.com>
Date: Wed, 18 Mar 2020 18:12:55 +0000
In-Reply-To: <24177.500.399884.150514@mariner.uk.xensource.com>
References: <5fa9d44f9e396a07b87ef9bd63094237b1efecc2.camel@infradead.org>
 <c8f6989f-5b9d-ffec-8e21-971d18a698a4@suse.com>
 <0fc1481c9f90fd91b3e1c41bc3e26da104770cb7.camel@infradead.org>
 <24177.500.399884.150514@mariner.uk.xensource.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH] Add -MP to CFLAGS along with -MMD.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0229637965324736560=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0229637965324736560==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-B0L7Ah1/Pzc9G7tQU2JQ"


--=-B0L7Ah1/Pzc9G7tQU2JQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-17 at 16:59 +0000, Ian Jackson wrote:
> David Woodhouse writes ("Re: [PATCH] Add -MP to CFLAGS along with -MMD.")=
:
> > On Tue, 2020-03-17 at 15:52 +0100, Jan Beulich wrote:
> > > On 17.03.2020 15:34, David Woodhouse wrote:
> > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > >=20
> > > > This causes gcc (yes, and clang) to emit phony targets for each dep=
endency.
> > > >=20
> > > > This means that when a header file is deleted, the C files which *u=
sed*
> > > > to include it will no longer stop building with bogus out-of-date
> > > > dependencies like this:
> > > >=20
> > > >    make[5]: *** No rule to make target
> > > >    '/home/dwmw2/git/xen/xen/include/asm/hvm/svm/amd-iommu-proto.h',
> > > >    needed by 'p2m.o'. Stop.
> > >=20
> > > In principle this would be nice, but there must be a reason this isn'=
t
> > > the default behavior. As the workaround for the issue at hand is quit=
e
> > > simple, I wouldn't like to treat addressing this one by some other
> > > anomaly/quirk. Do you (or does anyone else) have insight into why thi=
s
> > > isn't default behavior?
> >=20
> > No.
>=20
> I think this answer is:
>=20
> I think it could interfere with other rules intended to build (or
> rebuild) .h files.  This is particularly true for pattern or suffix
> rules.  I would have to RTFM properly and think about it to understand
> all the implications, to know what kind of nontrivial .h-rebuilding
> rules might be affected (and therefore, to know whether we have any
> such rules).

OK... I have attempted to address my frustration in a more coherent and
hopefully productive way (qv), rather than resorting to monosyllabic
responses. Apologies for that.

Back to the specifics of this patch...

GCC has had -MD support since so far back that I can't even find its
origin in the git history. The SVN conversion seems kind of broken but
I see signs of -MD having existed as far back as 1992.

The -MP support, adding 'phony targets' for the headers listed in the
-MD output, wasn't added until 2001:
https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3Da5a4ce3c3c0ee

It seems hardly surprising that the new behaviour was an additional
option to GCC instead of retroactively changing the default which had
already existed for around a decade. I do not think that questioning
the (understandably conservative) default behaviour of GCC is
appropriate or relevant in a review of a Xen patch such as this.

As it happens, the GCC documentation at=20
https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html#index-MP
is slightly wrong. It refers to these as 'phony targets' but they aren't re=
ally 'phony targets' in the sense referred to in make docs at
https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
because they aren't actually referenced from a .PHONY: rule.

Neither are they "empty recipes", as described further in
https://www.gnu.org/software/make/manual/html_node/Empty-Recipes.html
because empty recipes, well, aren't actually empty. Those would perhaps
more accurately be called "no-op recipes" because, like the example
there containing a single semicolon, they do nothing.

Both actual phony targets, and so-called empty recipes, do have the
effect of overriding implicit and pattern rules for the target in
question =E2=80=94 they could mess up auto-generated header files, for exam=
ple.

But what GCC -MP emits, despite its documentation, is neither of those
things. It merely emits an empty rule with no recipe and no actual
dependencies either. I don't think there's a specific term for that; it
*isn't* a 'phony rule', as I said.

It's probably best described as 'an explict rule without a recipe'.See=20
https://www.gnu.org/software/make/manual/html_node/Multiple-Rules.html
where it states that

	'If none of the explicit rules for a target has a recipe, then=20
	 make searches for an applicable implicit rule to find one
	 see Using Implicit Rules).'

So no, I don't think using -MP is going to break our handling of auto-
generated header files, but we'd have known that from a trivial
empirical build test within seconds, wouldn't we?

Here's another cut down test case. You can experiment with turning it
into a *real* 'phony rule', etc...

 $ grep ^ *
foo.c:#include <stdio.h>
foo.c:
foo.c:#include "foo.h"
foo.c:
foo.c:int main(void)
foo.c:{
foo.c:	printf(HELLO);
foo.c:	return 0;
foo.c:}
foo.h.orig:#define HELLO "Hello World!"
Makefile:#.PHONY: foo.h
Makefile:
Makefile:foo: foo.h foo.c
Makefile:	$(CC) -o foo foo.c
Makefile:
Makefile:%.h: %.h.orig
Makefile:	cp $< $@
Makefile:
Makefile:foo.h:
 $ make foo
cp foo.h.orig foo.h
cc -o foo foo.c


--=-B0L7Ah1/Pzc9G7tQU2JQ
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
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAw
MzE4MTgxMjU1WjAvBgkqhkiG9w0BCQQxIgQgdvtUw3iY64t07CEX2DqbqJXlKiYDgRg7Pet9P20Z
OaYwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBADGt0JcM1Qc18lwZKO1K0NvtJgsmhcDJk+EqVRZuAfwASJbUHAmN8iwYyzVT1Aru
MkN9lC4No2qqIEED/LHbUN30qKuFq85NTECK16SRaW7dQVP7dZ7EfHO3g8KnALhhY22HuFzdWh5P
ObzwnNDlgJ8ceP15cpQjYTOC4Sxt3Aebhe5/EMhdsVdyVd9/8mvNCQ7lBGrmQHEX3ig0ISQznzjI
rKi6W3i7qnoXIIOotD5BDAxYjbnAva7xTl2Lo36FqD8sh2cAp+hrFSKK+gVuZNsGF/2EjfOWTEMH
AUicqkJM9cOlHo6b8yjNTMG9uUbrp6Z+3TGPL/a7JcNXbnlWoNEAAAAAAAA=


--=-B0L7Ah1/Pzc9G7tQU2JQ--



--===============0229637965324736560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0229637965324736560==--


