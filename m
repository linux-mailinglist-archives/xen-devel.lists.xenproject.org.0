Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C17C246
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:53:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hso4Y-0001EP-HJ; Wed, 31 Jul 2019 12:51:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/j3d=V4=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1hso4W-0001EI-Ks
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:51:12 +0000
X-Inumbo-ID: de5f6c4b-b391-11e9-8980-bc764e045a96
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de5f6c4b-b391-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 12:51:10 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Content-Type: multipart/mixed; boundary="===============3217465075265140992=="
MIME-Version: 1.0
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 05:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; 
 d="p7s'?scan'208";a="256135855"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2019 05:51:04 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.40]) by
 IRSMSX106.ger.corp.intel.com ([169.254.8.234]) with mapi id 14.03.0439.000;
 Wed, 31 Jul 2019 13:51:03 +0100
From: "Hawrylko, Lukasz" <lukasz.hawrylko@intel.com>
To: "lars.kurth.xen@gmail.com" <lars.kurth.xen@gmail.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jgross@suse.com"
 <jgross@suse.com>, "julien.grall@arm.com" <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH] Intel TXT: add reviewer, move to Odd Fixes
 state
Thread-Index: AQHVRqQLKu2IE1z0Fk+wHuOLCyyd5abiw9IAgAAG94CAAALxgIAADdEAgAAD1YCAABTRgIABmr2AgAAQPQA=
Date: Wed, 31 Jul 2019 12:51:03 +0000
Message-ID: <3fb47280e961c479f21b540ffb1d7397c8923198.camel@intel.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
 <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
 <3dc11cbc-97a1-dae7-eba0-1bb0f8151244@arm.com>
 <47da6b72-614f-b29b-7357-ec6ea0bd3a17@citrix.com>
 <9BB67D01-4F6E-43DA-B080-2EA26AA67C43@xenproject.org>
 <f0a10555-0561-15dd-1516-fa3fe6b1d0db@arm.com>
In-Reply-To: <f0a10555-0561-15dd-1516-fa3fe6b1d0db@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.102.89.27]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "JBeulich@suse.com" <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3217465075265140992==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-7rj5H7xAlMczRnh1EuHj"

--=-7rj5H7xAlMczRnh1EuHj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am waiting for another mail address dedicated for mailing lists that
has the disclaimer disabled. This is an official way in Intel to do
that. I don't know when it will be ready, but I expect that this process
can take few days.

=46rom my perspective we can wait until I will have that mail address, so
I can submit this patch in "blessed" way. Sorry for this confusion.

Lukasz

On Wed, 2019-07-31 at 12:52 +0100, Julien Grall wrote:
> Hi Lars,
>=20
> On 30/07/2019 12:22, Lars Kurth wrote:
> >=20
> > > On 30 Jul 2019, at 11:08, George Dunlap <
> > > george.dunlap@citrix.com
> > > =20
> > > <mailto:
> > > george.dunlap@citrix.com
> > > >> wrote:
> > >=20
> > > On 7/30/19 10:54 AM, Julien Grall wrote:
> > > > Hi Jan,
> > > >=20
> > > > On 30/07/2019 10:05, Jan Beulich wrote:
> > > > > On 30.07.2019 10:54, Julien Grall wrote:
> > > > > > On 7/30/19 9:29 AM, Jan Beulich wrote:
> > > > > > > On 30.07.2019 08:56, Lukasz Hawrylko wrote:
> >=20
> > +full committers list and Juergen
> >=20
> > OK. We should have a separate discussion related to disclaimers:
> > make a formal=20
> > decision and afterwards document it in the contribution workflow. I
> > agree that=20
> > this makes sense, and this has been raised by Julien in the past
> > privately=20
> > related to questions on xen-devel@. It then turned out that Arm
> > folks from China=20
> > have consistently used disclaimers on contributions to mini-os and
> > unikraft.=20
> > This has stopped now, which is to Julien's credit. I suggested than
> > that Julien=20
> > should raise this issue formally as a policy change, which never
> > happened.
> >=20
> > I do not believe that we should block any patches from being applied
> > due to=20
> > disclaimers in absence of an agreed policy. Contributors sign a DCO
> > and that may=20
> > well override a disclaimer (we do not have access to the legal
> > advice that Greg=20
> > KH refers to). If there was a serious legal issue, the LF would have
> > contacted=20
> > all of its projects. And I also could not find any public reference
> > to such an=20
> > issue. This definitely something where the Advisory Board should
> > have some input.
> >=20
> > And in particular this patch also contains no code and should not be
> > blocked on=20
> > these grounds.
>=20
> I originally objected on this patch because the disclaimer issue was
> pointed out=20
> 3 versions ago and still not addressed. This then went on the
> discussion with=20
> Jan about the disclaimer.
>=20
> While reviewer only means you are CC to e-mails, I would at least
> expect them to=20
> understand the process and be able to address comments.
>=20
> > @Lukasz: please take note of this issue for the next time round. It
> > should be=20
> > easy enough to disable the disclaimer when sending to certain lists
>=20
> It is not easy enough as you may think ;). At Arm we have to go
> through a=20
> different SMTP server so we bypass exchange.
>=20
> > To move forward:
> > * There should be a policy discussion
>=20
> How should I raise it? Do you want a patch again contribution-
> guidelines?
>=20
> > * There should be AB input
> > * The outcome should be documented in=20
> > https://xenproject.org/help/contribution-guidelines/
> >  and the git contribution=20
> > workflow
>=20
> Cheers,
>=20
>=20

--=-7rj5H7xAlMczRnh1EuHj
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKdTCCBOsw
ggPToAMCAQICEDabxALowUBS+21KC0JI8fcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzEyMTEwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRCMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
yzuW/y/g0bznz8BD48M94luFzqHaqY9yGN9H/W0J7hOVBpl0rTQJ6kZ7z7hyDb9kf2UW4ZU25alC
i+q5m6NwHg+z9pcN7bQ84SSBueaYF7cXlAg7z3XyZbzSEYP7raeuWRf5fYvYzq8/uI7VNR8o/43w
PtDP10YDdO/0J5xrHxnC/9/aU+wTFSVsPqxsd7C58mnu7G4VRJ0n9PG4SfmYNC0h/5fLWuOWhxAv
6MuiK7MmvTPHLMclULgJqVSqG1MbBs0FbzoRHne4Cx0w6rtzPTrzo+bTRqhruaU18lQkzBk6OnyJ
UthtaDQIlfyGy2IlZ5F6QEyjItbdKcHHdjBX8wIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFNpBI5xaj3GvV4M+INPjZdsMywvbMA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAp9XGgH85hk/3IuN8F4nrFd24MAoau7Uq
M/of09XtyYg2dV0TIPqtxPZw4813r78WwsGIbvtO8VQ18dNktIxaq6+ym2zebqDh0z6Bvo63jKE/
HMj8oNV3ovnuo+7rGpCppcda4iVBG2CetB3WXbUVr82EzECN+wxmC4H9Rup+gn+t+qeBTaXulQfV
TYOvZ0eZPO+DyC2pVv5q5+xHljyUsVqpzsw89utuO8ZYaMsQGBRuFGOncRLEOhCtehy5B5aCI571
i4dDAv9LPODrEzm3PBfrNhlp8C0skak15VXWFzNuHd00AsxXxWSUT4TG8RiAH61Ua5GXsP1BIZwl
4WjK8DCCBYIwggRqoAMCAQICEzMAAHHzYGtP/vi6hNAAAAAAcfMwDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEIwHhcNMTkwMTA4MTIwMzM2WhcNMjAwMTAzMTIwMzM2WjBFMRkwFwYDVQQDExBIYXdyeWxr
bywgTHVrYXN6MSgwJgYJKoZIhvcNAQkBFhlsdWthc3ouaGF3cnlsa29AaW50ZWwuY29tMIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzaVoy3FU2Z8OF3NgtYIDhNAY9N1o7UXFyEV3SWxP
ptd136trCnyg1RGxCIwL8AJYqd5uMDzKYb+Vz5fwjRbuImCz47qVuuA/VdCSOmTjoG6aIaeA3jHj
O9W/S4H9wTsUQ5jNA7LTSVrTlOGfsy1tmSeRtYc6QIm5TxZ83z7QtxZqg3x7UsFb09IQ7vbI0ezf
VBqPCT7MCpEL9kn8Oi+kaLqj5EnNVmQlP6thF2mEyq/Uyd4+Zyd4wn5XSgnazVRha7o8Ntz7pPTk
qaf3z+pX4yJmyPzdHQO5UxfwvHA8hHPUXhX83MDYcYYDjP+aNwVPjwo+m9bLf7GrO/d5e0EVsQID
AQABo4ICNTCCAjEwHQYDVR0OBBYEFPHUkwveLWwE8tkGA3QLJU3A3VOqMB8GA1UdIwQYMBaAFNpB
I5xaj3GvV4M+INPjZdsMywvbMGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29t
L3JlcG9zaXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUy
MDRCLmNybDCBnwYIKwYBBQUHAQEEgZIwgY8wIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLmludGVs
LmNvbS8waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9zaXRvcnkvY2VydGlm
aWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRCLmNydDAL
BgNVHQ8EBAMCB4AwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUIhsOMdYSZ5VGD/YEohY6fU4KR
wAlngd69OZXwQwIBZAIBCTAfBgNVHSUEGDAWBggrBgEFBQcDBAYKKwYBBAGCNwoDDDApBgkrBgEE
AYI3FQoEHDAaMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwwwTwYDVR0RBEgwRqApBgorBgEEAYI3
FAIDoBsMGWx1a2Fzei5oYXdyeWxrb0BpbnRlbC5jb22BGWx1a2Fzei5oYXdyeWxrb0BpbnRlbC5j
b20wDQYJKoZIhvcNAQEFBQADggEBAG4Dd2NWIH5N3CXQQGWtunka9jgZG0cYpO1uXoBzRliNvmIC
sjfFEnt6UtzYcJ3i3muLy8vlanT5KF8gHM3I/SwCG9f1LgAV1UgDgoUQuInQEi4llIVJcBeAawXi
Zo3vp286gOi+Hqlo4On9k+p2QK8+TVNWJVby/CLQwO59HuZ7vevmn3xWJaFW06Z7Brr6rnPUFJsH
B5zWdoSc3ije0IRrVc7dquyRjfPsdIwShbhc9NgogaQcGYjTG8JfjaALcrE8Gg5dswDn+9bjooAz
nuQtivo1KlO0nUh36bi3oOd96SR6RfrnnBqmBK8DFyEhra8gDv82ztn/A4AhtvoCkjMxggIXMIIC
EwIBATCBkDB5MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFDASBgNVBAcTC1NhbnRhIENsYXJh
MRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlvbjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFz
aWMgSXNzdWluZyBDQSA0QgITMwAAcfNga0/++LqE0AAAAABx8zAJBgUrDgMCGgUAoF0wGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNzMxMTI1MTAyWjAjBgkqhkiG
9w0BCQQxFgQUrRDdaRMSrqtBaSVXuzIJScSmPeswDQYJKoZIhvcNAQEBBQAEggEAfZFpiEsJamrU
cKikEHTgg40G1GUjrqF3eEC1DxUmqFqGT1c1mwR+HV3dtvYLj4N114ucW5m7hiMYogbA66nIuQyM
cH3myt3QV3fvtYTt5SxMKPUKrmPKMvzZKlFLYjmwmBqCruiPXVXttYoC1FGc3sUkeCd192dCnR/v
hJLPFR+WSg0WPHlicrCkctbVJoxePqlaNH3qC7ElXf6TTWa8xnmOmpATRU7jiq/tWFEQIAva14E/
gJPsNNF9OrEewFs5Kr760jpsOgQwQayKpOzepySnx0M8gTmlrLYMLzKEZzVpDqog1xamVFsDkR2O
8t1WVaoT6QgPWgzWtXfQ88gpiQAAAAAAAA==


--=-7rj5H7xAlMczRnh1EuHj--

--===============3217465075265140992==
Content-Type: multipart/alternative; boundary="===============8986299217433558845=="
MIME-Version: 1.0
Content-Disposition: inline

--===============8986299217433558845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by
others is strictly prohibited.

--===============8986299217433558845==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<p>---------------------------------------------------------------------<br>
<strong style=3D"line-height: 11.25pt;"><span  style=3D"font-size: 9pt; col=
or:
#595959;"><span style=3D"font-family: 'Arial Narrow', sans-serif;">Intel
Technology Poland sp. z o.o.<br></span></span></strong><span style=3D"color:
#595959; font-family: 'Arial Narrow', sans-serif; font-size: 9pt; line-heig=
ht:
11.25pt;">ul. S&#322owackiego 173 | 80-298 Gda&#324sk | S&#261d Rejonowy Gd=
a&#324sk
P&#243&#322noc
| VII Wydzia&#322 Gospodarczy Krajowego Rejestru S&#261dowego - KRS 101882 =
| NIP
957-07-52-316 | Kapita&#322 zak&#322adowy 200.000 PLN.</span></p><p>

<span style=3D"font-size:8.0pt;font-family:&quot;Arial
Narrow&quot;,&quot;sans-serif&quot;;
mso-fareast-font-family:&quot;Times New
Roman&quot;;mso-bidi-font-family:Arial;
color:#595959;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-l=
anguage:
AR-SA">Ta wiadomo&#347&#263 wraz z za&#322&#261cznikami jest przeznaczona d=
la okre&#347lonego
adresata i mo&#380e zawiera&#263 informacje poufne. W razie przypadkowego o=
trzymania
tej wiadomo&#347ci, prosimy o powiadomienie nadawcy oraz trwa&#322e jej usu=
ni&#281cie;
jakiekolwiek przegl&#261danie lub rozpowszechnianie jest zabronione.<br>
This e-mail and any attachments may contain confidential material for the s=
ole
use of the intended recipient(s). If you are not the intended recipient,
please
contact the sender and delete all copies; any review or distribution by oth=
ers
is strictly prohibited.</span></p><p class=3D"MsoNormal"><o:p></o:p></p>

--===============8986299217433558845==--

--===============3217465075265140992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3217465075265140992==--

