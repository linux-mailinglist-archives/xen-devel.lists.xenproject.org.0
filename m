Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E710CC1
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 20:38:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLu2z-00006w-4u; Wed, 01 May 2019 18:33:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UR0A=TB=bombadil.srs.infradead.org=batv+d28726b38c8108e46d85+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLu2w-00006r-T7
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 18:33:35 +0000
X-Inumbo-ID: 9fcdb57f-6c3f-11e9-843c-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9fcdb57f-6c3f-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dv53GkjIa8zujlXbci9NBkMZ92d4fLcQTzZY9+5XuOU=; b=lxCgjvrP8Wa0McutOwy9yslYj
 v8ehDy7cypNTXcOkY2ScibhZjTWxoD94SpR73w641jbFV52X6aPohtWsdCu1kSA+eqWWD8lHQ9XsT
 Gd5ljuZgzdHWOpW9hHwRaJxmndIKlSpQTcislEbxQjGVCJBGUusgNSPJE/6CYImg84bPf5tfwg3is
 jlfQvrrQpT/8mrc9/8uqByIbaW742XNJ58bChw/prMdLeOrk8fUSGULXva+IaOtyiwAudHnN95Hcf
 823R4/Ny42iDE6p7ytelzzVVNiy3KzYan/aL6A0FCyu4j5dU80/DgwFnW/YlfmwD2Nwef17tLGtpT
 gCcsBi/Jw==;
Received: from [54.239.6.185] (helo=u3832b3a9db3152.ant.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLu2s-0001OS-De; Wed, 01 May 2019 18:33:30 +0000
Message-ID: <a82c51c45b399d1a0452c660e9705fdcb5d1fc09.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 01 May 2019 21:33:27 +0300
In-Reply-To: <eb9f67d6-80d3-5be0-7804-e3178ad00b93@citrix.com>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <22e1febec473b55fd7e43ffe02fb3a81f70a5e86.1556708226.git.dwmw2@infradead.org>
 <1c3cb13f-cba7-cc6a-36c7-fc156dd41b21@citrix.com>
 <eb9f67d6-80d3-5be0-7804-e3178ad00b93@citrix.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [RFC PATCH 1/7] x86/wakeup: Stop using %fs for
 lidt/lgdt
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
Content-Type: multipart/mixed; boundary="===============7846721384677644742=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7846721384677644742==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-nnzv1LnlWcW0SJcrToCa"


--=-nnzv1LnlWcW0SJcrToCa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-05-01 at 17:09 +0100, Andrew Cooper wrote:
> I'm afraid testing says no.  S3 works fine without this change, and
> resets with it.

Thanks for testing. That's obvious in retrospect =E2=80=94 although the wak=
eup
code is relocated alongside the trampoline code, it runs in real mode
with its own segment, and %ip=3D0000. So the idt_48 and gdt_48 really do
need to use "wakesym". For which they need to be shifted later in
trampline.S so that they're actually within the range of that segment.

However, neither staging-4.11 nor master are working here even before
the patch, so while I can fix my patch to go back to the existing
breakage and not add my own, I haven't managed to test. This is what I
get:

[root@localhost ~]# echo mem > /sys/power/state=20
(XEN) Preparing system for ACPI S3 state.
(XEN) Disabling non-boot CPUs ...
(XEN) Broke affinity for irq 14
(XEN) Removing cpu 1 from runqueue 1
(XEN)  No cpus left on runqueue, disabling
(XEN) Entering ACPI S3 state.
QEMU 2.11.1 monitor - type 'help' for more information
(qemu) system_wakeup=20
(qemu) (XEN) mce_intel.c:780: MCA Capability: firstbank 1, extended MCE MSR=
 0, SER
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) Adding cpu 1 to runqueue 0
(XEN) Assertion 'c !=3D old_pool && (c !=3D NULL || old_pool !=3D NULL)' fa=
iled at schedule.c:1848
(XEN) ----[ Xen-4.13-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08023c1b0>] schedule_cpu_switch+0x25b/0x318
(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
(XEN) rax: ffff82d0805c7060   rbx: 0000000000000001   rcx: 00000031bbf05100
(XEN) rdx: ffff83023c509840   rsi: ffff83023c509840   rdi: 0000000000000001
(XEN) rbp: ffff8300bfa8fce0   rsp: ffff8300bfa8fc80   r8:  000000000008f000
(XEN) r9:  ffff82d0805c4ec0   r10: 00000000bf9f7600   r11: 0000000979798d09
(XEN) r12: ffff83023c509840   r13: ffff82d080470720   r14: 0000000000000004
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000000026e0
(XEN) cr3: 00000000bfa83000   cr2: 0000000000000000
(XEN) fsb: 00007f91b5b6c740   gsb: ffff880075c00000   gss: 0000000000000000
(XEN) ds: 0018   es: 0000   fs: b800   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08023c1b0> (schedule_cpu_switch+0x25b/0x318):
(XEN)  85 d2 0f 85 f1 fd ff ff <0f> 0b 0f 0b 0f 0b 0f 0b 45 84 c0 75 39 48 =
8b 46
(XEN) Xen stack trace from rsp=3Dffff8300bfa8fc80:
(XEN)    0000000000000000 00007cff40570347 ffff82d0803818aa ffff82cfffffb30=
0
(XEN)    ffff82cfffffb280 0000000000000001 0000000000000000 000000000000000=
1
(XEN)    ffff83023c509840 ffff82d080596128 0000000000000004 000000000000000=
0
(XEN)    ffff8300bfa8fd10 ffff82d080203f3e 0000000000000286 000000000000000=
1
(XEN)    0000000000000001 ffff82d080596128 ffff8300bfa8fd40 ffff82d08020410=
8
(XEN)    ffff82d0804859e0 ffff82d080485368 ffff82d080485360 ffff82d08048534=
8
(XEN)    ffff8300bfa8fd90 ffff82d0802251bf 0000000000000000 000000000000000=
1
(XEN)    ffff8300bfa8fd80 0000000000000000 0000000000000001 ffff82d0803e9e8=
1
(XEN)    0000000000000001 ffff8300bfa8ffff ffff8300bfa8fdc0 ffff82d0802039d=
0
(XEN)    ffff8300bfa8ffff ffff82d080485340 0000000000000001 000000000000000=
3
(XEN)    ffff8300bfa8fdf0 ffff82d080203bc9 0000000000000000 000000000000000=
3
(XEN)    ffff8300bfa8ffff 00000000000026e0 ffff8300bfa8fe40 ffff82d0802dcd0=
3
(XEN)    ffff83023c49b000 0000000000000282 0000000000000000 ffff83023c51ef9=
0
(XEN)    ffff83023c49b000 0000000000000000 0000000000000000 ffff8300bfa8fff=
f
(XEN)    ffff8300bfa8fe60 ffff82d080208355 ffff83023c49b1d8 ffff82d0805c717=
0
(XEN)    ffff8300bfa8fe80 ffff82d08023f7b4 ffff8300bfa8fe80 ffff82d0805c716=
0
(XEN)    ffff8300bfa8feb0 ffff82d08023fadc 0000000000000000 ffff82d0805c717=
0
(XEN)    ffff82d08059b880 ffff82d0805b20a0 ffff8300bfa8fef0 ffff82d08027239=
7
(XEN)    ffff83023c4fb000 ffff83023c4fb000 ffff83023c49b000 ffff83023c50800=
0
(XEN)    0000000000000000 ffff83023c4b8000 ffff8300bfa8fda8 ffffc900025abd6=
0
(XEN) Xen call trace:
(XEN)    [<ffff82d08023c1b0>] schedule_cpu_switch+0x25b/0x318
(XEN)    [<ffff82d080203f3e>] cpupool.c#cpupool_assign_cpu_locked+0x31/0x12=
6
(XEN)    [<ffff82d080204108>] cpupool.c#cpu_callback+0xd5/0x31d
(XEN)    [<ffff82d0802251bf>] notifier_call_chain+0x64/0x8f
(XEN)    [<ffff82d0802039d0>] cpu_up+0xca/0xec
(XEN)    [<ffff82d080203bc9>] enable_nonboot_cpus+0x87/0xd9
(XEN)    [<ffff82d0802dcd03>] power.c#enter_state_helper+0xd7/0x48f
(XEN)    [<ffff82d080208355>] domain.c#continue_hypercall_tasklet_handler+0=
x4a/0xab
(XEN)    [<ffff82d08023f7b4>] tasklet.c#do_tasklet_work+0x7a/0xb2
(XEN)    [<ffff82d08023fadc>] do_tasklet+0x58/0x8a
(XEN)    [<ffff82d080272397>] domain.c#idle_loop+0x5e/0xb9
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'c !=3D old_pool && (c !=3D NULL || old_pool !=3D NULL)' fa=
iled at schedule.c:1848
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...



--=-nnzv1LnlWcW0SJcrToCa
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
NTAxMTgzMzI3WjAvBgkqhkiG9w0BCQQxIgQgu865E/Sp5Y8lZOxGXheubu3ddkIOFuj9isfRsQB0
qGUwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBACOcXSEO03CNSHI3V9dqPH/gGtQmxM1FsLtbTMsKeqqzVEPSCAKHusvdZ9PTIc6A
SkT0kXe4JzhrxPX/75h+6TWPtS6vYV+Ki5Jf5XLQhxaeYiwOCmM3iNxIBho6Ejl2laLNHiZWj2Ks
zbB8q33l8hwDbr3s1uYU1EYEOdVzIUWi/9Y+OCb9pbF+Q/FJe+Oh7YkAaqgDuc9aeUL+38PLt0Ew
KrDo0lieoervWN8V7nD55pSsG8jLpV5KvFku/ovcZy9Az6ykUQJhd/jVLnc0Dwove6BNx9cNgG3E
SQ7NXtfJzPj79U5XQo93RjbluJp5DYT9CXHX0DMcFKERJRRxbrUAAAAAAAA=


--=-nnzv1LnlWcW0SJcrToCa--



--===============7846721384677644742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7846721384677644742==--


