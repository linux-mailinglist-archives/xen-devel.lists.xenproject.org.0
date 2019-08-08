Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026048656F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvk6J-0001f6-El; Thu, 08 Aug 2019 15:13:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jdre=WE=merlin.srs.infradead.org=batv+cbf3729d93865f577a71+5828+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hvk6H-0001f0-S8
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:13:10 +0000
X-Inumbo-ID: 067947cd-b9ef-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 067947cd-b9ef-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JNJFZtKGBP3cVLr64pM06prFFwZf1lZZYqKwU8H1wXo=; b=mioLLNj6KHaWRbaReu61zY6Fa
 25qH/jWG3PcMwUQfXB55hmlfUtY9HceoauCZZWLmBjuzYoTNM+PvmvxFYhNicS7wa2qRhseYpo943
 Y/oRJRTadB8lKCiy59kawxcMOOy/x1LU6coOU5xuyGoNDtAM3g6FgGXWe6i4aP71J7RnmjjisFTqO
 RShwME6C1COdLD6OpBIRjpLSA7aahcUQZ5gZr03uibcd/0sxEZdSoMAYNlS4F+Acg5pHWTc/fWkV+
 UdD2AP+Vql8KZ+zcEVUTOc0mcXxIuoY8Axykj3hxnX5BdEa1WMVo5QlBXMfZzcSJflplxzD0YH3Z5
 +RNXidMfg==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvk69-0002vo-3v; Thu, 08 Aug 2019 15:13:01 +0000
Message-ID: <44b25042bb3d7fefe67ae68a9212d8384778ec42.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Ian Jackson <ian.jackson@citrix.com>
Date: Thu, 08 Aug 2019 16:12:59 +0100
In-Reply-To: <23882.61481.990906.474113@mariner.uk.xensource.com>
References: <936c39728ca0c96d0666551046cf08ebc8774dd8.camel@infradead.org>
 <5aa0116479240e5c2751fbaa745a6071a98f9480.camel@infradead.org>
 <23882.61481.990906.474113@mariner.uk.xensource.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2] tools/xenstore: Do not abort xenstore-ls
 if a node disappears while iterating
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============7086157660016780956=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7086157660016780956==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-2RZhzokAvnkzEIuknGZG"


--=-2RZhzokAvnkzEIuknGZG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-07 at 16:37 +0100, Ian Jackson wrote:
> I think it is not safe to continue if we get a permissions error.  I
> think that would mean "we were not able to determine whether this node
> exists", not "this node does not exist".

Either way, I interpreted it more as "haha screw you, now I'm not going
to tell you whether any *other* node exists".

This is the test case I actually started with:

(dom0) # for a in `seq 1 1000` ; do xenstore-write /local/domain/2/foo/$a $=
a ; done

Now simultaneously:

(dom0) # for a in `seq 1 999` ; do xenstore-rm /local/domain/2/foo/$a  ; do=
ne
(dom2) # while true ; do ./xenstore-ls -p /local/domain/2/foo | grep -c 100=
0;  done

I do expect to see node 1000, every time. With my patch, that works.

> So with a permissions error silently ignored, xenstore-ls might
> silently produce partial output.

Even without the race condition, we get partial output. In this test
case, observe that node four is absent from what dom2 reports, and we
get *two* error messages about node three.

(dom0) # xenstore-ls -p /local/domain/2/foo
one =3D "one"  . . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)
two =3D "two"  . . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)
three =3D "three"  . . . . . . . . . . . . . . . . . . . . . .  (n0)
four =3D "four"  . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)

(dom2) # xenstore-ls -p /local/domain/2/foo
one =3D "one"  . . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)
two =3D "two"  . . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)
three:
xenstore-ls:=20
could not access permissions for three: Permission denied

xenstore-ls: xs_directory (/local/domain/2/foo/three): Permission denied



The tool actually makes three calls for each node it touches. If the
xs_read() fails, it silently prints ":\n" and doesn't report the errno.

If the (optional) xs_get_permissions() fails, it *warns* but continues,
attempting to recurse into the node in question.

If the xs_directory() fails, it aborts and doesn't even continue.

My v2 patch makes the third case (xs_directory()) behave like the first
(xs_read()), and silently continue. It gives me:

(dom2) # ./xenstore-ls -p  /local/domain/2/foo
one =3D "one"  . . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)
two =3D "two"  . . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)
three:
xenstore-ls:=20
could not access permissions for three: Permission denied

four =3D "four"  . . . . . . . . . . . . . . . . . . . . . . .  (n0,r2)


(dom2) # ./xenstore-ls /local/domain/2/foo
one =3D "one"
two =3D "two"
three:

four =3D "four"

> Given that the code doesn't have a way to print an error message and
> record the error code or exit status for later, I think the best
> approach is probably exactly David's patch only without the mention of
> EACCES.

Well... here's an incremental straw man patch based on the existing v2,
which will print an error for the *first* operation that fails, and
should cope with race conditions too.

Tested with

(dom0) # while true; do xenstore-chmod /local/domain/2/foo/three n0; xensto=
re-chmod /local/domain/2/foo/three n0 r2 ; done
(dom2) # while true ;  do echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D ; sudo ./xenstore-ls  -p  /local/domain/2/foo; done

diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_cli=
ent.c
index 9fcd3d2f9e..c5d0b18106 100644
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -140,7 +140,7 @@ static int show_whole_path =3D 0;
=20
 #define MIN(a, b) (((a) < (b))? (a) : (b))
=20
-static void do_ls(struct xs_handle *h, char *path, int cur_depth, int show=
_perms)
+static void do_ls(struct xs_handle *h, char *path, int cur_depth, int show=
_perms, int ignore_errors)
 {
     char **e;
     char *newpath, *val;
@@ -151,7 +151,13 @@ static void do_ls(struct xs_handle *h, char *path, int=
 cur_depth, int show_perms
     e =3D xs_directory(h, XBT_NULL, path, &num);
     if (e =3D=3D NULL) {
         if (cur_depth && (errno =3D=3D ENOENT || errno =3D=3D EACCES)) {
-            /* If a node disappears while recursing, silently move on. */
+            /*
+             * If a node disappears or becomes inaccessible while traversi=
ng,
+             * only print an error if previous operations on this node hav=
en't
+             * done do. Then move on.
+             */
+            if (!ignore_errors)
+                warn("xs_directory (%s)", path);
             return;
         }
=20
@@ -197,7 +203,7 @@ static void do_ls(struct xs_handle *h, char *path, int =
cur_depth, int show_perms
=20
         /* Print value */
         if (val =3D=3D NULL) {
-            printf(":\n");
+            printf(": (%s)", strerror(errno));
         }
         else {
             if (max_width < (linewid + len + TAG_LEN)) {
@@ -222,7 +228,10 @@ static void do_ls(struct xs_handle *h, char *path, int=
 cur_depth, int show_perms
         if (show_perms) {
             perms =3D xs_get_permissions(h, XBT_NULL, newpath, &nperms);
             if (perms =3D=3D NULL) {
-                warn("\ncould not access permissions for %s", e[i]);
+                /* Don't repeat an error message if xs_read() already fail=
ed */
+                if (val)
+                    warn("could not access permissions for %s", e[i]);
+                val =3D NULL;
             }
             else {
                 int i;
@@ -239,7 +248,7 @@ static void do_ls(struct xs_handle *h, char *path, int =
cur_depth, int show_perms
=20
         putchar('\n');
            =20
-        do_ls(h, newpath, cur_depth+1, show_perms);=20
+        do_ls(h, newpath, cur_depth+1, show_perms, !val);
     }
     free(e);
     free(newpath);
@@ -448,7 +457,7 @@ perform(enum mode mode, int optind, int argc, char **ar=
gv, struct xs_handle *xsh
             break;
         }
         case MODE_ls: {
-            do_ls(xsh, argv[optind], 0, prefix);
+            do_ls(xsh, argv[optind], 0, prefix, 0);
             optind++;
             break;
         }

--=-2RZhzokAvnkzEIuknGZG
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
ODA4MTUxMjU5WjAvBgkqhkiG9w0BCQQxIgQgkYNHUAqJPdKIjYrOFVykM3QBOQSi2rB69fj6du+m
7KYwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAHTvkl8OhYrjWfr4ReBy8TC/QOB5BwmS+C/trYNvCS6Y77iPM/7n9lOkbOOJmwt5
UHy6aQlNDzLkouZjNm7nZ/cblO/H/0nM/OkObHhtBVbsNtxpNCAApi1O0LonMWcfypmgdVOkkdcv
yusQVe+sZO3i4ZuqtmgSAAfpaErxFLYHaFbmEIaG0rokXIyAwT/yZS2rtfmii/Uh8UsqQDNCnUeg
tZcHF8iAFX0GYv2/4/YEMcqysX7IaHrgUm0ygzTkg7kwlIH2LJaREBY8/n284DN5w90qALXiHEWV
DjtVUelmYr0qv97sZWPCWsipy2kkcLaGpIz7mayDFcjEKtIZRtsAAAAAAAA=


--=-2RZhzokAvnkzEIuknGZG--



--===============7086157660016780956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7086157660016780956==--


