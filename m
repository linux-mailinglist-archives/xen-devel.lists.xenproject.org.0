Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA026D813
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 11:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIqY0-0003X5-1z; Thu, 17 Sep 2020 09:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=an+d=C2=itk-engineering.de=daniel.wagner2@srs-us1.protection.inumbo.net>)
 id 1kIqW3-0003RJ-0X
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 09:47:47 +0000
X-Inumbo-ID: b85bf446-8330-4c9e-bd14-4f62f8c2ddca
Received: from mx0.itk-engineering.de (unknown [212.121.145.30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b85bf446-8330-4c9e-bd14-4f62f8c2ddca;
 Thu, 17 Sep 2020 09:47:44 +0000 (UTC)
From: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: AW: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
Thread-Topic: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri imx8qxp:
 Missing kernel boot module)
Thread-Index: AQHWjE8h1rQ5rm+XzUKc/iwUSIXfQalr2YmAgAC34BA=
Date: Thu, 17 Sep 2020 09:47:42 +0000
Message-ID: <c5bb2ff6fb534eb3be072c0112ba3cdb@itk-engineering.de>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
 <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
 <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-c2processedorg: bf590b95-2eae-4fb0-b3c4-e2662b925c35
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=2.16.840.1.101.3.4.2.3;
 boundary="----=_NextPart_000_0024_01D68CE8.59A1B700"
MIME-Version: 1.0
x-msw-jemd-newsletter: false
X-Mailman-Approved-At: Thu, 17 Sep 2020 09:49:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

------=_NextPart_000_0024_01D68CE8.59A1B700
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Urspr=FCngliche Nachricht-----
> Von: Stefano Stabellini <sstabellini@kernel.org>
> Gesendet: Donnerstag, 17. September 2020 02:31
> An: Julien Grall <julien@xen.org>
> Cc: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>; xen-
> devel@lists.xenproject.org; Stefano Stabellini =
<sstabellini@kernel.org>;
> Bertrand Marquis <Bertrand.Marquis@arm.com>; Andre Przywara
> <andre.przywara@arm.com>
> Betreff: Re: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri
imx8qxp:
> Missing kernel boot module)
>=20
> On Wed, 16 Sep 2020, Julien Grall wrote:
> > On 14/09/2020 15:26, Daniel Wagner2 wrote:
> > > Hi Julien,
> >
> > Hi Daniel,
> >
> > I am moving the thread to xen-devel and adding a couple of more =
folks.
> >
> > > >
> > > > >
> > > > > this is the full version of the fdt that threw the error:
> > > > > https://pastebin.com/63TZ9z3k
> > > > > The problematic memory node appears in line 126
> > > >
> > > > Thanks! The output looks corrupted as some of the lines are not
valid DTB:
> > > >
> > > > fsl,pins =3D * 0x000000009300184c [0x00000048];
> > > >
> > > > Although, I am not sure if it is just U-boot dumping the DTB
differently.
> > > >
> > > > Anyway, after removing the "corrupted" line, I managed to get a
> > > > compile
> > > the
> > > > DTB. I don't have a Colibri IMX8QXP. However, given this is an
> > > > early
> > > parsing
> > > > error, I have just embed the DTB in Xen binary via =
CONFIG_DTB_FILE.
> > > >
> > > > Unfortunately I couldn't reproduce your error. This either
> > > > suggests the
> > > DTB gets
> > > > corrupted or Xen doesn't access the DTB with the correct memory
> attribute.
> > > >
> > > > Do you have the DTB in hand?
> > >
> > > Sorry for the corrupted version, I've uploaded the DTB
> > > (fsl-imx8qxp-colibri-eval-v3.dtb) to
> > > =
https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBzt
> > > W1S6?usp
> > > =3Dsharing
> > >
> > > I have also uploaded my modified xen source files.
> > > 1. arch/arm/bootfdt.c
> > > where I have added the additional printk's seen in the log and 2.
> > > arch/arm/setup.c where I rerun the devicetree parser in line 935 =
to
> > > get the logs, since the console is not yet initialised when the
> > > function is called for the first time and I didn't manage to =
enable
> > > earlyprintk.
> > >
> > > I think the breaking point is the second memory bank which appears
> > > in the logs (see the output line marked with "!!")  with =
start=3D0x8
> > > 8000 0000 and size=3D0.
> > > It isn't specified in the DTB, so I am not sure where this comes =
from.
> > > It has size=3D0 so
> > > if ( !size )
> > >      {
> > >          printk("invalid size, bank %d\n",i);
> > >          return -EINVAL;
> > >      }
> > > In bootfdt.c makes the function stop.
> > >
> > > Log:
> > > (XEN) arch/arm/bootfdt.c: early_scan_node
> > > (XEN) -> fdt: node `memory@80000000': parsing
> > > (XEN) -> process_memory_node
> > > (XEN)
> > > (XEN) arch/arm/bootfdt.c: process_memory_node
> > > (XEN) ->found memory:reg
> > > (XEN) ->cell=3D
> > > (XEN) ->banks=3D2
> > > (XEN) ->mem->nr_banks=3D1
> > > (XEN) ->NR_MEM_BANKS=3D128
> > > (XEN) ->start=3D0x80200000 size=3D0x7fe00000 !! (XEN)
> > > ->start=3D0x880000000 size=3D0
> > > (XEN) invalid size, bank 1
> > > (XEN) END of arch/arm/bootfdt.c: process_memory_node
> >
> > When I tried to run it on the model I get:
> >
> > (XEN) device_tree_for_each_node: memory@80000000
> > (XEN)
> > (XEN) arch/arm/bootfdt.c: early_scan_node
> > (XEN) -> fdt: node `memory@80000000': parsing
> > (XEN) -> process_memory_node
> > (XEN)
> > (XEN) arch/arm/bootfdt.c: process_memory_node
> > (XEN) ->found memory:reg
> > (XEN) ->cell=3D
> > (XEN) ->banks=3D1
> > (XEN) ->mem->nr_banks=3D0
> > (XEN) ->NR_MEM_BANKS=3D128
> > (XEN) ->start=3D0x80000000 size=3D0x40000000
> > (XEN) END of arch/arm/bootfdt.c: process_memory_node
> >
> > >
> > > Btw 8_8000_0000 is the start address of this systems DDR Main
> > > memory, according to the Reference Manual of the i.MX8QXP.
> > I couldn't find this value in the DT. It is possible that U-boot is
> > modifying the memory node before jumping to Xen (or Linux).
> >
> > Looking at Linux, they seem to ignore any bank with size =3D=3D 0. I =
am
> > starting to wonder whether your DT is (ab)using it.
> >
> > Do you have Linux running on baremetal on this board? If so would =
you
> > mind to dump the DT from the userspace (via /proc/device-tree) this
time?

I do have linux running on baremetal on the plattform.=20
Created dtb and dts with devicetree-compiler:
dtc -I fs -O dtb -o ~/dtb-dump /proc/device-tree
dtc -I dtb -O dts -o ~/dts-dump ~/dtb-dump

uploaded both to google drive:
https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6

You were right, after the boot, the memory node contains the second bank
with
size=3D0.

memory@80000000 {
	device_type =3D "memory";
	reg =3D < 0x00 0x80200000 0x00 0x7fe00000 0x08 0x80000000 0x00 0x00 >;
};

> >
> > In any case, we may want to relax the check in Xen. Any opinions?
>=20
> Yeah, ignoring a bank with size=3D0 is fine. I checked the epapr and =
it
doesn't
> specify that size=3D0 is invalid, so I think it is actually better to =
ignore
it and
> continue even from a spec perspective.

------=_NextPart_000_0024_01D68CE8.59A1B700
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCCGIow
ggRoMIIDUKADAgECAg83NRRmfkG6TWrQeQbivbcwDQYJKoZIhvcNAQEFBQAwSzESMBAGCgmSJomT
8ixkARkWAmRlMR8wHQYKCZImiZPyLGQBGRYPaXRrLWVuZ2luZWVyaW5nMRQwEgYDVQQDEwtJVEst
Uk9PVC1DQTAeFw0xMTA4MDQxMjA1NTRaFw0zMTA4MDQxMjE1NTNaMEsxEjAQBgoJkiaJk/IsZAEZ
FgJkZTEfMB0GCgmSJomT8ixkARkWD2l0ay1lbmdpbmVlcmluZzEUMBIGA1UEAxMLSVRLLVJPT1Qt
Q0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCURptpxkeRen0Z3FqDJmVCZEHrxGl/
CknSG6tSIWAl6Z5kG+GmbFEd4dK268mnm4sPRnH5uostWrOPP4d+9ODBSgysFpm9YVUfgg7SUL2A
Aa8Fc3tedcPVD1SAAloo6SRMig1RCDjW77g3MVUFm83QMRAIhkuR31NhUcNXu5MW2LkZNihrE741
5iNfxDykYWWzC1F0J3EOTCaFkKPLcm4cTKA6xydvMEGqDBno6bHMavPKFsARFoavhkl1Awjy6fph
eB6TWd1xR/XOuNsAmJCCUfIep82El3FPcWm5R/R7COjT3MvrJAS/OaB5m4/Kk6WpFAvAPZ0DCjGD
fRUnSkK/AgMBAAGjggFHMIIBQzALBgNVHQ8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBAzAdBgNV
HQ4EFgQUvQAGRESbQttNtURfDzjZq4H7XQgwSAYDVR0fAQH/BD4wPDA6oDigNoY0aHR0cDovL3Br
aS5pdGstZW5naW5lZXJpbmcuZGUvcHVibGljL2l0ay1yb290LWNhLmNybDAQBgkrBgEEAYI3FQEE
AwIBADBTBgNVHSAETDBKMEgGCCsGAQQBgpYeMDwwOgYIKwYBBQUHAgEWLmh0dHA6Ly9wa2kuaXRr
LWVuZ2luZWVyaW5nLmRlL3B1YmxpYy9sZWdhbC5odG0wUAYIKwYBBQUHAQEERDBCMEAGCCsGAQUF
BzAChjRodHRwOi8vcGtpLml0ay1lbmdpbmVlcmluZy5kZS9wdWJsaWMvaXRrLXJvb3QtY2EuY3J0
MA0GCSqGSIb3DQEBBQUAA4IBAQBwja+7l5R4Q1JnXL/WOs3b1edWJB2HzeL5xmOYdIHoSu9AXtRZ
PV7Dw2giNvv/aSCDbOlbmdc9cjPd1BDBz4yipEP3U6E3ZlFyHsFW3AgBwLnmBxC8sGFYMmDcvi5B
pEDN9FAg0ulwrUClIMauY1fJi+aP3XZvtY1iF7+VmKv4hEfWDNIfbyEo/QWWrilJu9fQYwgQLtAF
CaM6wZGLZH1WACuQGzx1P1eQar10FzIypueA+ES70JArdN0VfZbx6O5IQxw6RqNiz5LZLqQ2Xwp/
WZ83G9vuWAo7h8ayuQz/H0AXYorsfE/MszsjHm1X3Rv9zFZaSKDnTPvK/AIJfJg3MIIExTCCA62g
AwIBAgIKYQ8qkQAAAAAABzANBgkqhkiG9w0BAQsFADBLMRIwEAYKCZImiZPyLGQBGRYCZGUxHzAd
BgoJkiaJk/IsZAEZFg9pdGstZW5naW5lZXJpbmcxFDASBgNVBAMTC0lUSy1ST09ULUNBMB4XDTE1
MDQyOTEzMjMxM1oXDTI1MDQyOTEzMzMxM1owTDESMBAGCgmSJomT8ixkARkWAmRlMR8wHQYKCZIm
iZPyLGQBGRYPaXRrLWVuZ2luZWVyaW5nMRUwEwYDVQQDEwxJVEstSVNTVUUtQ0EwggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQChnA2FbmfuLJESnicRHzZT+/ce853EC4BScJ/goXeHIM7W
34dVfEe994ib/tVESmpu+uzyJbNMMP6inxwIEx2hVr+Y4ey/uldWUcPUeS5372zAqdK1fOv7jPS6
8xLx1D37U4+PzbsnWzfgAy+VN7Xu95vptWWK/8F60sEi4V+Zn3ZYblKXTIoMM4o/vFidOs5rlZun
t1uasmXCjq2I6k7ZMYjT2JPosWprHfrEfuJg4ucprSK96fYRKcmL0/dFuwy9QrA9BtiJVg07YeMK
jhDBeHwAEhw4GdiCQ97wkrTVz6zHch/gpsn/Ga6NKgDOfKbVCBZD137Q13DHgXLFILwhAgMBAAGj
ggGoMIIBpDASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBQ2JFlXok+d2gXre4gx
02BWF9glZzAdBgNVHQ4EFgQUSDC39c3DWKZ5//VxZnWk9+AxKGUwVAYDVR0gBE0wSzBJBggrBgEE
AYKWHjA9MDsGCCsGAQUFBwIBFi9odHRwOi8vcGtpLml0ay1lbmdpbmVlcmluZy5kZS9wdWJsaWMv
bGVnYWwuaHRtADAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwEgYDVR0T
AQH/BAgwBgEB/wIBAjAfBgNVHSMEGDAWgBS9AAZERJtC2021RF8PONmrgftdCDBFBgNVHR8EPjA8
MDqgOKA2hjRodHRwOi8vcGtpLml0ay1lbmdpbmVlcmluZy5kZS9wdWJsaWMvaXRrLXJvb3QtY2Eu
Y3JsMFAGCCsGAQUFBwEBBEQwQjBABggrBgEFBQcwAoY0aHR0cDovL3BraS5pdGstZW5naW5lZXJp
bmcuZGUvcHVibGljL2l0ay1yb290LWNhLmNydDANBgkqhkiG9w0BAQsFAAOCAQEASjQUccZRE3+I
qJGk5fdTXQ3imouPC9ruzYaszoUX2d1YsNmSHvfQdxdTeEv0khMLrtXViz6wnvy+OjH975OXrk3v
IYrBwX5fK5JIVNsCiImzrptEGRaRc8ToX/jSt9XVQij3DcLGUkhFjvthSw7AIBsVtby7t6rZaEZn
4HIFc1Pp41bHdnpPPbph/11/D7pYeF7Kcmk7AC3A6msKxZqefbwdySikmN//XkKnOHi8AheSMnQC
J4cTmoe4NHMXy4pZbVMaz/tGT9AbM+jnlToMP5XRpuqb4sL0SVe282hGjXAcBfggEy2qMGL328iE
LDuyD1llE40v9GE5KkX5K0S2bDCCB4UwggZtoAMCAQICExEAAK4PAq/vgLS3Qr8AAQAArg8wDQYJ
KoZIhvcNAQELBQAwTDESMBAGCgmSJomT8ixkARkWAmRlMR8wHQYKCZImiZPyLGQBGRYPaXRrLWVu
Z2luZWVyaW5nMRUwEwYDVQQDEwxJVEstSVNTVUUtQ0EwHhcNMTkxMDA0MDYxOTIyWhcNMjExMDAz
MDYxOTIyWjCBtjEVMBMGCgmSJomT8ixkARkWBWxvY2FsMRMwEQYKCZImiZPyLGQBGRYDaXRrMQww
CgYDVQQLEwNJVEsxITAfBgNVBAsMGFByYWt0aWthbnRlbiAmIFN0dWRlbnRlbjEMMAoGA1UECxMD
Umx6MRcwFQYDVQQDEw5EYW5pZWwgV2FnbmVyMjEwMC4GCSqGSIb3DQEJARYhZGFuaWVsLndhZ25l
cjJAaXRrLWVuZ2luZWVyaW5nLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr+hS
P0CWM//EZBlASuX/PZqKKq9E+30p3Mm9aLSzxuAn0vodj0jNE/6qa6prgjCk2JymcwAaUiVrvYZc
X++d237DtT1EnVSzMOfwz3QYIuL9XtiqQf6S0B5Y/35ODJL5NYkTWAHXYqpf0qLRV1xrMouO1yXo
DGIkPTe2aCTa+MxBCX9osT5UUqd9mE0/amQbhYMhXN59EpSawbvVOw2LshrVyEkApCqZNNMjahNy
0PDZYUmka06tjAWUL9xecFC7Cz7qS+8GGx0KDSYij71IvgE/37uF7SN020QPQ2ZzhBZfgoagnj2U
4rkl2M0RCNPz/0tIywsxvvIE9x2rVG5dhQIDAQABo4ID8zCCA+8wPQYJKwYBBAGCNxUHBDAwLgYm
KwYBBAGCNxUIh9ibWoG69j6H2ZUe89JRh7irVoF7hvnCWoeuzGcCAWQCAQ0wKQYDVR0lBCIwIAYK
KwYBBAGCNwoDDAYIKwYBBQUHAwMGCCsGAQUFBwMEMA4GA1UdDwEB/wQEAwIGwDBUBgNVHSAETTBL
MEkGCCsGAQQBgpYeMD0wOwYIKwYBBQUHAgEWL2h0dHA6Ly9wa2kuaXRrLWVuZ2luZWVyaW5nLmRl
L3B1YmxpYy9sZWdhbC5odG0AMDUGCSsGAQQBgjcVCgQoMCYwDAYKKwYBBAGCNwoDDDAKBggrBgEF
BQcDAzAKBggrBgEFBQcDBDAdBgNVHQ4EFgQUnJ5utHlrKYDgCMGdquoiiaCFdt0wHwYDVR0jBBgw
FoAUSDC39c3DWKZ5//VxZnWk9+AxKGUwggELBgNVHR8EggECMIH/MIH8oIH5oIH2hoG5bGRhcDov
Ly9DTj1JVEstSVNTVUUtQ0EoMSksQ049aXRrLWlzc3VlLWNhLENOPUNEUCxDTj1QdWJsaWMlMjBL
ZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWl0ayxEQz1sb2Nh
bD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0
aW9uUG9pbnSGOGh0dHA6Ly9wa2kuaXRrLWVuZ2luZWVyaW5nLmRlL3B1YmxpYy9JVEstSVNTVUUt
Q0EoMSkuY3JsMIIBNAYIKwYBBQUHAQEEggEmMIIBIjCBqQYIKwYBBQUHMAKGgZxsZGFwOi8vL0NO
PUlUSy1JU1NVRS1DQSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vydmlj
ZXMsQ049Q29uZmlndXJhdGlvbixEQz1pdGssREM9bG9jYWw/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29i
amVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwLgYIKwYBBQUHMAGGImh0dHA6Ly9wa2ku
aXRrLWVuZ2luZWVyaW5nLmRlL29jc3AwRAYIKwYBBQUHMAKGOGh0dHA6Ly9wa2kuaXRrLWVuZ2lu
ZWVyaW5nLmRlL3B1YmxpYy9JVEstSVNTVUUtQ0EoMSkuY3J0MF8GA1UdEQRYMFagMQYKKwYBBAGC
NxQCA6AjDCFkYW5pZWwud2FnbmVyMkBpdGstZW5naW5lZXJpbmcuZGWBIWRhbmllbC53YWduZXIy
QGl0ay1lbmdpbmVlcmluZy5kZTANBgkqhkiG9w0BAQsFAAOCAQEAlojMO0AiAd6YmAZ6nnWY/TCT
6WOxWKm3JmbdyNINqmc1h8GHz4i0zaqAPTFUAfsRSlzFYAWsFwtc+9A+7eqJxNs9PCPs04rlnJat
0Bws9/2yZBTGMdinIJ4KQovaN2pNw5yvZw3MXsgiaC96Vxm8s0D78ahJ3Bhubcfew11EL++2yoNs
f1HmS0/6FSVKNEHvzpfy38PC81N8wPY39+sx2hXI308DaZWjQtma7AdsdEHAqdr44R4FNfgwZYZ7
Z8hDHm7K8bW8RvY+Z1qdvc9KsvONdZnk3ZG0hiCqvUbMaCddMLbOwu7PlKlQ2VyOuFUpfNDfK35C
9lmI2rbR6FxpsjCCB8gwggawoAMCAQICExEAAK4O5k39C2blUioAAQAArg4wDQYJKoZIhvcNAQEL
BQAwTDESMBAGCgmSJomT8ixkARkWAmRlMR8wHQYKCZImiZPyLGQBGRYPaXRrLWVuZ2luZWVyaW5n
MRUwEwYDVQQDEwxJVEstSVNTVUUtQ0EwHhcNMTkxMDA0MDYxODU5WhcNMjExMDAzMDYxODU5WjCB
tjEVMBMGCgmSJomT8ixkARkWBWxvY2FsMRMwEQYKCZImiZPyLGQBGRYDaXRrMQwwCgYDVQQLEwNJ
VEsxITAfBgNVBAsMGFByYWt0aWthbnRlbiAmIFN0dWRlbnRlbjEMMAoGA1UECxMDUmx6MRcwFQYD
VQQDEw5EYW5pZWwgV2FnbmVyMjEwMC4GCSqGSIb3DQEJARYhZGFuaWVsLndhZ25lcjJAaXRrLWVu
Z2luZWVyaW5nLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA8lqiSBKj3Qg5S/Fc
j/IDmHH8T+pBv8awdQcPkwZNynDDYC5JPiHP01Poy7B2V6W8OQ97XnMjOWM2zvGPmJtOvYOpu8fb
QV700C4UCNjVaLw2MTAZ5zEHeW0CbQTLYSKS9EgrEuWelI1hQrk7EsUmTKuPy4hd/gLvBPdQaOpY
3Gb9tK09qQDTnG+p94yefmqiWy2Tn51QVp37QiwX+9L/fpD+L9JxhHdC4KVfLyrGumMVVrGWufI2
DyqWNkrx4O34HrpLYmXR5XSAYZFbDmamPEQRdCi9tefB0rIqqEgRl7CMiUkyYE0z0WDBrfoOsQZv
d732EitrvByf+z08mGM/pQIDAQABo4IENjCCBDIwPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUI
h9ibWoG69j6H2ZUe89JRh7irVoF7hP/sNob24EACAWQCAQ8wKQYDVR0lBCIwIAYIKwYBBQUHAwIG
CCsGAQUFBwMEBgorBgEEAYI3CgMEMAsGA1UdDwQEAwIFoDBUBgNVHSAETTBLMEkGCCsGAQQBgpYe
MD0wOwYIKwYBBQUHAgEWL2h0dHA6Ly9wa2kuaXRrLWVuZ2luZWVyaW5nLmRlL3B1YmxpYy9sZWdh
bC5odG0AMDUGCSsGAQQBgjcVCgQoMCYwCgYIKwYBBQUHAwIwCgYIKwYBBQUHAwQwDAYKKwYBBAGC
NwoDBDBEBgkqhkiG9w0BCQ8ENzA1MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYF
Kw4DAgcwCgYIKoZIhvcNAwcwHQYDVR0OBBYEFHKMFlp3s89ONCpMsQAVG3kCnejGMB8GA1UdIwQY
MBaAFEgwt/XNw1imef/1cWZ1pPfgMShlMIIBCwYDVR0fBIIBAjCB/zCB/KCB+aCB9oaBuWxkYXA6
Ly8vQ049SVRLLUlTU1VFLUNBKDEpLENOPWl0ay1pc3N1ZS1jYSxDTj1DRFAsQ049UHVibGljJTIw
S2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1pdGssREM9bG9j
YWw/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1
dGlvblBvaW50hjhodHRwOi8vcGtpLml0ay1lbmdpbmVlcmluZy5kZS9wdWJsaWMvSVRLLUlTU1VF
LUNBKDEpLmNybDCCATQGCCsGAQUFBwEBBIIBJjCCASIwgakGCCsGAQUFBzAChoGcbGRhcDovLy9D
Tj1JVEstSVNTVUUtQ0EsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZp
Y2VzLENOPUNvbmZpZ3VyYXRpb24sREM9aXRrLERDPWxvY2FsP2NBQ2VydGlmaWNhdGU/YmFzZT9v
YmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MC4GCCsGAQUFBzABhiJodHRwOi8vcGtp
Lml0ay1lbmdpbmVlcmluZy5kZS9vY3NwMEQGCCsGAQUFBzAChjhodHRwOi8vcGtpLml0ay1lbmdp
bmVlcmluZy5kZS9wdWJsaWMvSVRLLUlTU1VFLUNBKDEpLmNydDBfBgNVHREEWDBWoDEGCisGAQQB
gjcUAgOgIwwhZGFuaWVsLndhZ25lcjJAaXRrLWVuZ2luZWVyaW5nLmRlgSFkYW5pZWwud2FnbmVy
MkBpdGstZW5naW5lZXJpbmcuZGUwDQYJKoZIhvcNAQELBQADggEBAFGH/1/4fuQC/XhnFGnucdYu
YZ7Lq4GANtiozlL21s0qo7mbj26KfjVGEAxrJmeZ5oRyIDy3RsKTuLUGble+Gh9ABYD5l7rUO1/u
YevEUzeVWlFFdjAYBGKAZ0Ax8vyvpVum5cKbW/dV0WdusCdIHGbNjPCj/0aztEnQ2YzyGZdMAKBr
2luenYwT6iipW+fY/PHCRCjuq4/YeMUdyZ10J6V2HkfvgY1KKhzfm8YsT5b53X/Ys10AdQqTD0yg
PrOr0b9zUGmUdLS7k/2QPoEMaVKSNTEKUM+f0cpSQcSPiA1QbEZwRHtZmKIaS0TZYQmOvrrxRsn7
f6DrZrca9rw2mysxggO1MIIDsQIBATBjMEwxEjAQBgoJkiaJk/IsZAEZFgJkZTEfMB0GCgmSJomT
8ixkARkWD2l0ay1lbmdpbmVlcmluZzEVMBMGA1UEAxMMSVRLLUlTU1VFLUNBAhMRAACuDwKv74C0
t0K/AAEAAK4PMA0GCWCGSAFlAwQCAwUAoIICIzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yMDA5MTcwOTQ3NDFaME8GCSqGSIb3DQEJBDFCBECdUnfBhG5m3GhboMxk
wzxowAIdoohp6NX4cKl/blOBjB910JkUiortR1JN3v85rhKkwNURgoaLfTfIQ7SQtsGrMHIGCSsG
AQQBgjcQBDFlMGMwTDESMBAGCgmSJomT8ixkARkWAmRlMR8wHQYKCZImiZPyLGQBGRYPaXRrLWVu
Z2luZWVyaW5nMRUwEwYDVQQDEwxJVEstSVNTVUUtQ0ECExEAAK4O5k39C2blUioAAQAArg4wdAYL
KoZIhvcNAQkQAgsxZaBjMEwxEjAQBgoJkiaJk/IsZAEZFgJkZTEfMB0GCgmSJomT8ixkARkWD2l0
ay1lbmdpbmVlcmluZzEVMBMGA1UEAxMMSVRLLUlTU1VFLUNBAhMRAACuDuZN/Qtm5VIqAAEAAK4O
MIGtBgkqhkiG9w0BCQ8xgZ8wgZwwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQBKjALBglghkgBZQME
ARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDALBglghkgBZQMEAgMwCwYJKoZIhvcNAQEKMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwBwYF
Kw4DAhowDQYJKoZIhvcNAQEBBQAEggEAYCP0IuHJHRTvuuhj53ZBCUDel+NF5Zql7x1EH148gNly
o9xUO9vk63wZrDZhsmSEV5NiOjic95J6+lxGPsQwJtvY79HGivPBv8MwU6n4QtfzIGGbnPDMa+WH
N0neyTQ+hU3p1PRnsPyvg9qY7y2JoDog79BIFwVnEY6pFkxP93NLRV97pAqBEsgakzQWXHNeAPF5
BpyxmgT2ohSRnND3TNu/qrJtwFZmbX3Kon22jk/NzumTeAxvOkJtITN7sZDW1yie1ETa6S/bxA7Y
BvJ0lg30q88xaZt0e68CUMk+qwd7nxMralVmGDS3+v0kK7d8LOMkJ03NsaQbrt8tEXqnwwAAAAAA
AA==

------=_NextPart_000_0024_01D68CE8.59A1B700--

