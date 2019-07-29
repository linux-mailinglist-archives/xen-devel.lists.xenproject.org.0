Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15178E61
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:50:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6wt-0003ag-9j; Mon, 29 Jul 2019 14:48:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LvHy=V2=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1hs6wr-0003aW-L4
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:48:25 +0000
X-Inumbo-ID: e9b6e1d0-b20f-11e9-b2d9-1398ab929e59
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9b6e1d0-b20f-11e9-b2d9-1398ab929e59;
 Mon, 29 Jul 2019 14:48:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Content-Type: multipart/mixed; boundary="===============5900739458283095399=="
MIME-Version: 1.0
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 07:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; 
 d="p7s'?scan'208";a="346646811"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by orsmga005.jf.intel.com with ESMTP; 29 Jul 2019 07:48:17 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.40]) by
 IRSMSX106.ger.corp.intel.com ([169.254.8.234]) with mapi id 14.03.0439.000;
 Mon, 29 Jul 2019 15:48:17 +0100
From: "Hawrylko, Lukasz" <lukasz.hawrylko@intel.com>
To: "lars.kurth.xen@gmail.com" <lars.kurth.xen@gmail.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "tamas@tklengyel.com"
 <tamas@tklengyel.com>, "Wang, Shane" <shane.wang@intel.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>, "persaur@gmail.com" <persaur@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
Thread-Index: AQHVQvAnlTUxSZF8PEa/bQBOxDBHMKbbofGAgADL6wCAAJa1AIAEnhiA
Date: Mon, 29 Jul 2019 14:48:16 +0000
Message-ID: <4459250d7915cc7543447610777c0c98fbb6e70f.camel@intel.com>
References: <20190725135112.83569-1-roger.pau@citrix.com>
 <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
 <20190726071758.geuxwscfhs2zftfr@Air-de-Roger>
 <49FE39B5-BDC8-43D6-8940-A4BDA6D22F62@gmail.com>
In-Reply-To: <49FE39B5-BDC8-43D6-8940-A4BDA6D22F62@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.102.89.27]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
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
Cc: "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "tim@xen.org" <tim@xen.org>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5900739458283095399==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-3jeyNl0dZwAeX8bnFPvy"

--=-3jeyNl0dZwAeX8bnFPvy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lars

As you suggested, I have sent patch that added myself as TXT maintainer:
https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg02077.html

I didn't change TXT support state to "supported", I guess that this should =
be done by XEN community.

Thanks,
Lukasz

-----Original Message-----
From: Lars Kurth <lars.kurth.xen@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengye=
l.com>, Lukasz Hawrylko <
lukasz.hawrylko@intel.com>, Shane Wang <shane.wang@intel.com>, Jun Nakajima=
 <jun.nakajima@intel.com>
, Rich Persaud <persaur@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabel=
lini@kernel.org>, Wei Liu
<wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap=
 <
George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ia=
n Jackson <
ian.jackson@eu.citrix.com>, Tim (Xen.org) <tim@xen.org>, Julien Grall <juli=
en.grall@arm.com>, 'Jan
Beulich' <jbeulich@suse.com>, tboot-devel@lists.sourceforge.net, Marek Marc=
zykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com>, Daniel Smith <dpsmith@apertussolutions.co=
m>
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare orph=
aned
Date: Fri, 26 Jul 2019 17:17:22 +0100


> On 26 Jul 2019, at 08:17, Roger Pau Monn=C3=A9 <
> roger.pau@citrix.com
> > wrote:
>=20
> On Thu, Jul 25, 2019 at 03:08:07PM -0400, Rich Persaud wrote:
> > (cc Intel and tboot-devel)
> >=20
> > Hi Roger,
> >=20
> > Thanks for your interest in documenting the status of maintenance for I=
ntel TXT support in
> > Xen.  Intel TXT and Xen are deployed in production today by OpenXT and =
QubesOS for boot
> > integrity.  Xen was a pioneering adopter of DRTM, almost a decade ago, =
but mainstream enterprise
> > computing is now catching up with the May 2019 release of Windows 10 Sy=
stemGuard.  It would be
> > nice to avoid "orphaning" one of Xen's competitive advantages in 2019.
>=20
> Thanks for the feedback! Just to be clear, this is not a plan to
> remove the tboot code from Xen in any way, it's just a IMO needed step
> in order to reflect the current maintainership status of the code, and
> likely a way to move forward, please see below.


> > > On Jul 25, 2019, at 09:51, Roger Pau Monne <
> > > roger.pau@citrix.com
> > > > wrote:
> > >=20
> > > Gang Wei Intel email address has been bouncing for some time now,
> >=20
> > Gang Wei's replacement is Lukasz Hawrylko, who posted on March 6, 2019:
> > https://lists.gt.net/xen/devel/546401
> >=20
> >=20
> > Could you include Lukasz patch, along with Julien's requested formattin=
g changes, in your update
> > to the MAINTAINERS file?
>=20
> I think it would be better if Lukasz could resend his patch, now that
> the section entry is orphaned we can add/remove reviewers and
> maintainers without being blocked.

I added Tamas who I believe works for Intel in the security area and maybe =
he can connect some dots
here. I believe that Intel's security organisation is entirely different fr=
om our normal interfaces
with Intel, so he may be able to help.=20

@Lukasz: could you re-send the patch related to maintainership after the pa=
tch has been applied?
Regarding Jan's and Julien's concerns about awarding maintainership straigh=
t away. We tend to ask
prospective maintainers who don't have a track record of reviewing code in =
the community to start as
reviewers. An example of this is the VM EVENT, MEM ACCESS and MONITOR compo=
nent where Razvan is
handing over maintainership to two other bitdefender staff members. In prac=
tice, this makes not a
lot of difference if you review contributions to TXT.=20

Regarding removing Shane Wang as maintainer, the case for this is somewhat =
stronger than simply not
replying to [0]. The last mail Shane sent to xen-devel@ was in 2011. This -=
 according to his
LinkedIn profile - relates to a career change towards becoming a manager an=
d being responsible for
components that are not related to virtualisation. Shane should probably ha=
ve stepped down as a
maintainer pro-actively, but we normally don't remove maintainers unless th=
ere is a problem. Clearly
the lack of a responsive maintainer is now a problem: we already have been =
unable to instate Lukasz
as maintainer in March for that reason as technically an ACK from an existi=
ng maintainer is needed.

@Roger: this should be recorded in the commit message. I would also suggest=
 you refer to the thread
related to Lukasz taking over maintainership, which was essentially blocked=
 because Gang had
probably sent the maintainership change request too late and couldn't ACK i=
t because he probably
didn't have access to his Intel email address anymore.

So I think removing Shane is fair enough. In particular if it helps instate=
 a replacement
maintainer.=20

> > As a new Xen maintainer and contributor, Lukasz may not yet be familiar=
 with the procedures and
> > practices of the Xen community.  We can welcome his new maintainership =
role without dropping
> > support for a feature, that (a) he is maintaining, (b) is used by Xen.
>=20
> Sure, my plan is to declare the support orphaned, so that Lukasz (or
> anyone who has interest in this code) can be added as a reviewer
> afterwards without us being blocked on an Ack from Shane Wang, who is
> unresponsive (as per the thread pointed to in the commit message).


> > > and
> > > the other maintainer is non-responsive to patches [0], so remove
> > > maintainers and declare INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
> > > orphaned.
> > >=20
> > > [0]=20
> > > https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg00563=
.html
> > >=20
> >=20
> > Since we have at least one Intel maintainer, Lukasz, the feature need n=
ot be orphaned.  If Shawn
> > is not responding to the request to confirm Lukasz as maintainer, the X=
en community has multiple
> > communication channels with Intel.  Pragmatically, a review of the tboo=
t-devel archives shows
> > that Lukasz is working on tboot development. =20
>=20
> The orphaned step is IMO needed in order to move forward and add a new
> reviewer/maintainer. Without removing the current maintainers and
> declaring it orphaned we would be blocked on an Ack from Shane Wang in
> order to add or remove maintainers. Removing current maintainers and
> adding Lukasz in the same patch would still require an Ack from the
> current owners.

@All: we probably need to look at the hand-over of maintainership, given th=
is issue. We should
really not be in this position and should have a way to deal with this in a=
 more efficient way.=20


Best Regards
Lars



--=-3jeyNl0dZwAeX8bnFPvy
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
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
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNzI5MTQ0ODE1WjAjBgkqhkiG
9w0BCQQxFgQUUxfiNDCV6VUJ4m7lYjEDTx5aNaQwDQYJKoZIhvcNAQEBBQAEggEAqTaFdLI1Jm43
KobS1ZyBlmBQT1fAZRkKH4JpxCqPaD+ANvCf2v6N7blXoRkTq2e3/sjampGtBzyKpIZRaU/MWwUh
JKjcLyspCovguZrJRKqy0eeVTlnIyqwZavEPm/VesHb9T4M5HKv3Na9DcNqgwP+oYGCYiD5px9nf
I9u+6X55+bKNVJwj8IL50UtzDfdPgx131x55Mmt5r+8t8yt/+1GG63RNnoe4xb2H/Gz8j9CLYaxZ
/X7HNWJxPVWF0ktIBFpYGVH4aMzCRD0bAJrYUdmz6hSFl/xL79mi609WbTENIxjzMboO8ftgc9NG
olRDcP61DI9CXYCpq2R8b+V7+QAAAAAAAA==


--=-3jeyNl0dZwAeX8bnFPvy--

--===============5900739458283095399==
Content-Type: multipart/alternative; boundary="===============0696008784550877573=="
MIME-Version: 1.0
Content-Disposition: inline

--===============0696008784550877573==
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

--===============0696008784550877573==
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

--===============0696008784550877573==--

--===============5900739458283095399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5900739458283095399==--

