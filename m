Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE27A3E5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:20:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOGU-0005yf-TN; Tue, 30 Jul 2019 09:17:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PKz9=V3=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1hsOGT-0005yY-QV
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:17:49 +0000
X-Inumbo-ID: e5b214ee-b2aa-11e9-8980-bc764e045a96
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5b214ee-b2aa-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:17:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Content-Type: multipart/mixed; boundary="===============4504839366276486366=="
MIME-Version: 1.0
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 02:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; 
 d="p7s'?scan'208";a="255556305"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
 by orsmga001.jf.intel.com with ESMTP; 30 Jul 2019 02:17:44 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.40]) by
 IRSMSX107.ger.corp.intel.com ([169.254.10.251]) with mapi id 14.03.0439.000;
 Tue, 30 Jul 2019 10:17:43 +0100
From: "Hawrylko, Lukasz" <lukasz.hawrylko@intel.com>
To: "JBeulich@suse.com" <JBeulich@suse.com>, "julien.grall@arm.com"
 <julien.grall@arm.com>
Thread-Topic: [PATCH] Intel TXT: add reviewer, move to Odd Fixes state
Thread-Index: AQHVRqQLKu2IE1z0Fk+wHuOLCyyd5abiw9IAgAAG94CAAALxgIAAA4IA
Date: Tue, 30 Jul 2019 09:17:42 +0000
Message-ID: <9df036bc31653c2194c232751be013e6ca10b62b.camel@intel.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
 <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
In-Reply-To: <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4504839366276486366==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-t9vGGVdrHGUHDHXVTyT8"

--=-t9vGGVdrHGUHDHXVTyT8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have sent request to IT how can I disable this disclaimer. It is added
by server side for all mails that go outside Intel. I didn't see that
footer when I read my own mail on mailing list.

Lukasz

-----Original Message-----
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>,
Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <
George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
Lukasz Hawrylko <lukasz.hawrylko@intel.com>, Stefano Stabellini <
sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] Intel TXT: add reviewer, move to Odd Fixes state
Date: Tue, 30 Jul 2019 09:05:09 +0000

On 30.07.2019 10:54, Julien Grall wrote:
> On 7/30/19 9:29 AM, Jan Beulich wrote:
> > On 30.07.2019 08:56, Lukasz Hawrylko wrote:
> > > Support for Intel TXT has orphaned status right now because
> > > no active maintainter is listed. Adding myself as reviewer
> > > and moving it to Odd Fixes state.
> > >=20
> > > Signed-off-by: Lukasz Hawrylko <
> > > lukasz.hawrylko@intel.com
> > > >
> > > ---
> > >    MAINTAINERS | 3 ++-
> > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 89a01b710b..ca300e87c8 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -240,7 +240,8 @@ S:    Maintained
> > >  F:    tools/golang
> > >  INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
> > > -S:    Orphaned
> > > +R:    Lukasz Hawrylko <
> > > lukasz.hawrylko@intel.com
> > > >
> > > +S:    Odd Fixes
> >=20
> > I guess we should give it a few days for objections to be raised
> > against this slightly inconsistent state, but I think that's the
> > best way to express the current state of things (hence my
> > suggestion to this effect). If no objections turn up, I've queued
> > this onto my to-be-committed list.
>=20
> I have some objections regarding the process itself... On the first
> version of this patch, it was pointed out that the e-mail shouldn't
> be sent with disclaimer. This is now the third version and the
> disclaimer is still present.

Okay, I must have missed both earlier requests to this effect. I've
gone back to the list archives though, and I couldn't find any such
request either from July or June. Therefore ...

> Technically, no patch should be applied when there are a disclaimer.

... I'd also like to ask for the background of this. It would never
have occurred to me that I should pay attention to possible
disclaimers or alike on patch submissions.

Jan

--=-t9vGGVdrHGUHDHXVTyT8
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
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNzMwMDkxNzQyWjAjBgkqhkiG
9w0BCQQxFgQUf06g5x2TLGOKwPYv0xd/a7ws6SMwDQYJKoZIhvcNAQEBBQAEggEACTepKKovxr6W
yhYKsxJrtJEPLzo6CIJf0z/F0u1juCIt5xp7o/47yacgNlEsANbBgLT++1IQHB6jY/gLBXeivPA5
uo2Zk0DtnGMXyg6HfTR14wZQA0y6GhG7gFgPbh3QwSjvXNUByvHSqeVb5AfODFV0jwR4poLVwOHI
k1sKyTtMthh7BCiydHHIJnEEsF/UE4p7s1ArrPTbdld07PRJd26+Z+o8kKm9cPAaaxPxf7brfS8p
VHqRd4vixwIq6x4B40N3C6w8lccDc6H/iesNOEmAB5IpfvEEBguTIlEfAcuVI7np+m6i3cmHjLB5
KRS67ZCsof0XkhGHZUPDFMu1CgAAAAAAAA==


--=-t9vGGVdrHGUHDHXVTyT8--

--===============4504839366276486366==
Content-Type: multipart/alternative; boundary="===============7288886231433031567=="
MIME-Version: 1.0
Content-Disposition: inline

--===============7288886231433031567==
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

--===============7288886231433031567==
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

--===============7288886231433031567==--

--===============4504839366276486366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4504839366276486366==--

