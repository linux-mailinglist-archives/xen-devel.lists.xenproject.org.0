Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1C95D08
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 13:16:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i024e-00082Z-1z; Tue, 20 Aug 2019 11:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xv/m=WQ=amazon.de=prvs=128763efb=wipawel@srs-us1.protection.inumbo.net>)
 id 1i024d-00082O-24
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 11:13:11 +0000
X-Inumbo-ID: 7df8608a-c33b-11e9-b90c-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7df8608a-c33b-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566299590; x=1597835590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=hE8MOiHnbSQFez/JOVxfKlO7/V43WNXIJhaU++MNylo=;
 b=pqNqJ4mU0fX/YrCCBuvFZq5bqCR8x2ObMXKGPz+thkcJBzhebS7Plco9
 jSwTM2AOb3p+k3GVNMc4W+oVsVXqzQZ1lgMuF0qrHp3Q/QAPwyeKwJNwg
 FNwUXNC2kc1Z8/+1f6jwh2nNKvD91zfhFT52wWc+/uicvrw8PCvfRz8dr 0=;
X-Amazon-filename: PGPMIME Versions Identification, encrypted.asc
X-IronPort-AV: E=Sophos;i="5.64,408,1559520000"; 
 d="asc'?scan'208";a="695485859"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 20 Aug 2019 11:13:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7D22FA2445; Tue, 20 Aug 2019 11:13:03 +0000 (UTC)
Received: from EX13D05EUC004.ant.amazon.com (10.43.164.38) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 11:13:02 +0000
Received: from EX13D05EUC004.ant.amazon.com (10.43.164.38) by
 EX13D05EUC004.ant.amazon.com (10.43.164.38) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 11:13:01 +0000
Received: from EX13D05EUC004.ant.amazon.com ([10.43.164.38]) by
 EX13D05EUC004.ant.amazon.com ([10.43.164.38]) with mapi id 15.00.1367.000;
 Tue, 20 Aug 2019 11:13:01 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [PATCH livepatch-python 1/1] livepatch: Add python bindings for
 livepatch operations
Thread-Index: AQHVU13A+lav3LIpREOK1FpVjrchn6cDBo6AgADjCwA=
Date: Tue, 20 Aug 2019 11:12:56 +0000
Message-ID: <7BA412A7-2CCB-4EEE-9E2D-7EB07A6A3FA5@amazon.com>
References: <20190815113646.12918-1-wipawel@amazon.de>
 <20190819213957.GD1457@mail-itl>
In-Reply-To: <20190819213957.GD1457@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.237]
Content-Type: multipart/mixed;
 boundary="_003_7BA412A72CCB4EEE9E2D7EB07A6A3FA5amazoncom_"
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH livepatch-python 1/1] livepatch: Add python
 bindings for livepatch operations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xen.org>, "Pohlack, Martin" <mpohlack@amazon.de>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "amazein@amazon.de" <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_003_7BA412A72CCB4EEE9E2D7EB07A6A3FA5amazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable





Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_003_7BA412A72CCB4EEE9E2D7EB07A6A3FA5amazoncom_
Content-Type: application/pgp-encrypted;
	name="PGPMIME Versions Identification"
Content-Description: PGP/MIME Versions Identification
Content-Disposition: attachment; filename="PGPMIME Versions Identification";
	size=13; creation-date="Tue, 20 Aug 2019 11:12:56 GMT";
	modification-date="Tue, 20 Aug 2019 11:12:56 GMT"
Content-ID: <3CDF5874AF94024C83F757B409A01691@amazon.com>
Content-Transfer-Encoding: base64

VmVyc2lvbjogMQ0NCg==

--_003_7BA412A72CCB4EEE9E2D7EB07A6A3FA5amazoncom_
Content-Type: application/octet-stream; name="encrypted.asc"
Content-Description: OpenPGP encrypted message.asc
Content-Disposition: attachment; filename="encrypted.asc"; size=3639;
	creation-date="Tue, 20 Aug 2019 11:12:56 GMT";
	modification-date="Tue, 20 Aug 2019 11:12:56 GMT"
Content-ID: <9B0E514FF55B3A499E1A6F0BFC9C839A@amazon.com>
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tDQoNCmhRSU1BNkF5MHIzQjRkcW1BUkFBcFZLcjNS
SmFqektqS0crUXF2cGc2am5KVjU0SFBxVm5nSlg0MitNTmNBamQNCjRLZXdFc3NPMWlzNnhpVzcv
K0FYSVF6UkFGYXZ0c3dFNzdNTUtTMDZLTDlBM3R1M0ozTVo0YWZCaGdFUVBpYm8NCldvQXFEWmhw
RG1rRTFmQnAzTzlCMktTNENMQzFoTzZuTnJtOU4rcndhWVMwcXZUZU00Szk0Tks2OWtGZ2tPNVoN
CkpIWnRrZWdKaEhBOUZxRFI2Y0g2WUY1SDBMZlVHQ3AwUHlUb0Rybkg0bDdCMU9qWjk1R0ZvM251
WGQ3RVNzQWYNClJYREtUVkd3L1N0YnhsU3VWbTVjb2J3ejZWNVo3VVpSalhOLzdwZTZYU0d3K3B6
cnBxRFJqbTZEQjJVWXJpZmQNCndGSnNMRDBmWW10SlVObC9VWXNnTW4rNTVOZTZHOFRnMEk0Skx1
WlNUQitJcVpDSjJCYzFJZGovRUpFQWkxYy8NCmRWRFJzSTd6SUhFamNpMkFyT2RoVXhvTE1oVXVC
YVFuSkVIdWVjOE0zRXN1WnN4b1ZVL0M5TkFMbGd2VVpiZC8NCnV1dTI3UjJiL2x5Z3lldXdXQnB0
bzkxa0VXSFpSb3VSdmg3WXZ1Q0JXbzBnN21nVGNMVkxEMHpZZ1RpMkE3VUENCkh4UXIxalQ3MExZ
eE44U2YwRGZrYlIzVWdLbEhJQUdMUlJmU2NyeVVvQ080WG1rdU5vR3JSUTNkN0YzQkdkVHINCkZa
eHJhMVZoMkZBYnA5SFJncGhMczgxOGhyNWZHRi9JR2R1UDBVWkkwcHhjVWF5QXJhUTJFd0VxaEFM
Vjk1Q3ANClFzS3hJWlpQYklQMU9XL3ZwbGZ3ZmxlcGRLL3g3cTZyYmpJcndnVGcrSWpIckx1SVpT
dzVIZWs5dFJ3Wnh0YlMNCjZ3RmFGRjIzZmxMZ1I5SnM2UDc5Tk5nMkw4aVhVOXVqL1FoYjczNzFP
a0pNTkwwb0JGVjlwWXE5RG9BM0s0NCsNCllFaTFCSFU4dTlTR2xNUllFc0c4YUdSOXZERk1yQ2FU
Z3dHTTF5S3c2K0hBZG9BZmZzMm9ic2pnZWJORk8waHQNCmNqc0VpYnhpcDNFWEx6dktZRi9iZEJi
cml4cWduN0o5VnY1Q29MZFpjZkZQdm4vZ0xKWURnZG9UakdJTHFLdkENCnRvMi9vSlZ2WFZEYitC
VXp2UGYyakVmSlQrYllwNWNvR1FXekYwTzFUOU10NTY2b0d6amdaVWVvUjhOeFAzT0ENCnZ1VDBF
cmtNMWlYNmpOc3YzR0tuV3lZYUE1Nlg1cjZEK3AwQzFudnZHcWlWSWQyUXk0M3pYS3d0STIrM0dp
REUNClNWd2tDTUNXRnJMZGsrbXdxMDNUUDZBdjMxdVFjd0dMR0ZBeWxhSW1tTTZkUzRySm5raXhO
KzJyU0kzMytOMWwNCm9WNDBXYTBBWVRJTEN3MkorZjRua3NJNXA1bVA3VjJ4WTFpOGY3Wkp4aFEy
bXlMVUJmRlYvRjV6WE5kcXcyN1UNClRFSWNBRUNZV09LV0FVSS84Rm1xQjdMWUFJZ0lpemQ1clZy
bmhJSE1uRGVpemg2amd2U1JhdkJhTFhxeXpYRk0NCk1Lb3hqOFhPaUJxRE5jY29PT0JqMDIrV0Qx
SERKTWdqS0dqNlc5MU5ERjV5WHM5MzdwdGtKWWxXaUFEZ2dDeGMNCjh4bzNacll5SmppcE1QT3VY
dGhLS1haRk1nL1EyWFdlRnJkQXc5dVBHbklPRWVieWR0NUtoU0hkaFIyY2ZObnINCm1Sdk8vVERI
VVhSUlo3RHcvb2p5VUY3Q0FEdUpGKzVTRlhmeXBBOVNVQnptRG56RldsbTAySlRzcWYvWXJTcEgN
CmVPNGc1MHZ2MWxRbUlZZEI3LzR4MEd2MXZMTm9qRHlhaXU1YTJ2VEQ0WnV0VXJhNTZ5ajBjVTFv
T0Y5TEtJdzcNCnowd0JjR1JqMUh3UVZhaEtKdjhZcTl1anFKL3RKSjFuemZhOFlaSTFtd2FQYmoz
ekRVVWlidSt2Z0FzNlJpUjcNCkpYNTNzZjkzTWhIQVU0UElCRUJUakx6ckorcFhvdEtKZmxCbU1k
V1hzdnZKc1dJejY2WHk0UkNHbW9XWW5lTlgNCi9IZ1IyWXhKMFJ3dDFkc1U3N25PcGtMbHh1MHpa
b2c4U0JkbDY3QXg3R1pTUnBkR053ZEpLd0ZnQTM4NE4vdzUNClBZYjlqcjZpdktOUVB4OENiQ3Ns
MzZzRDRQTFJXcXNOUlBjbVE4OFhKS0JlTUw2aXRzelpnbWZhQzZIKzg5T3gNCjBkcE5OeElkN2tH
M0hWNm03UlBCMjBYUjVONjZQckhsdWdZQjNLUU50ejNOd2ZrWCtVOWJWMUpBRzVhVTlEb2INCmxk
eE02MWgzZ3hTVlBjTkxVcVhuYmpUdGVsZ2gwcFlOTTZMMHNmMEJQYVFmNVpyUUtUUE1QUWFZMUJZ
L0NmK1ANCk16bkR3Qm9IZnVDQlJxWWJhV2RLTTgwTzN6bmZFa29qOXNaeXMvT25GdUZ1ejFsVVF6
SzJ5Rks3anE5bDNwVE4NCjdNREdYbDZxOHVGb0dUbHhWVFpoYm1HNkxmcXJpcEpPL01hWkViSW1K
a0M2TUdEQk92REQralRzNjJ6Q1JXTzENCmJiN1FTdHl5enN5NW9MdXBTREI4OEc0V0NPeHl5UDR1
Z0RZNDBkUm5OZVB4WEdUQ3ErYVh4V25nc2N4aFR5a1YNCmdXVTVaT2l1S2s3Qk5scjFjRSt6RmVL
YXQvQ3ZQVjN1QjdnRUFFQXhPQUNQa1h6UC9HOGovVStQQStteVRwL04NCnhLN2FBMTc5Uk4rUnBp
QWxtU0o3aWptaVNRc3RkNEw4aDNqdGF2dlVoRHBCS0NYTjNmUmZOaTBoVnNOK1RTbVANCnpyZEVm
YmM3ZzBiMVE2bHhqTWFLdHhYNTg5alZjaU0vSEtGODFHOHk0NGRjT3BTbHpYdERuemZISUFvME1w
VE4NClJVdkRaK2JxNW0rYVU1ellaRGpibUh1OTdNT0QvOGV0Y1pjKy9zMk51bzE2Yjh5ek5mek85
VUtYVGdQQVg4b3kNCkE5aW1nTFV3UnF5ZUFNbWh2MWRYbjU4UzY0WXNad1J4L09aVnV2djhuY3hK
eUQyNnpEeWpyUGhUVjhhVmtZSzINCklaQndKbExFUFlNSG5zM3lQTnI3TmNFYXc1SURlYjlUeklO
MDN3RWQzRjVBOTF6Q1p6WDRsL1FRZWhTZ3RyMlcNCk9NVjUvZ0FybWxLRVh5YTlVWnpJSWtOM1FB
WkdOUUVxSE1Tenk3VnpuQTlYWi9CZmE1bmxpempKTmhjUm9HVmgNClpHQmJIcUQxVCtudDNwQ3M1
QmRFSWNaQXN4VWsyOUpZbUlyVytxK3pjLzcyZWVuRE5VZ3V4VnA2bVppYkVPVFcNCnA3UHV4SndY
TkRHLzNQSVRpTUdBYWs5cFhyZVo1Q2hqZmJqNWxWMEYzVjFzQmp6eTlQQi9YQ0luUllZalV5dXEN
CjBpSkdYZ3I3U2FOOWFsSVBIYVNRMDVTRkJ6ZjVsUXo3RmR5U3drWnE5akJtTlhYN01hK1cvdTkw
VWJMeDdWdDYNCnQvQVdIb1RwbVFUWFdtTnBUN3NidFlDWmhpVnd2bHp6ZXkzY1plUHdNVEd6WnZO
MzVmSEpGL2hMSDV2WUFKTzQNCmxuekdFYWgzakZxTTM1OVhLVGtZa3dUaXRIcC9zZVZ2dW51M2lO
M1A0eHRjZkVBYnJPZzlWUXdRc1dnU2xJa08NCmtxV1Izb2x1OTNMMEFjN3pvTkJXbXdPL1F3QkVO
VlN3cHZvalZDZmVCT3dEc2J1TDFhaTh2SEU2SHN4U3E0NDANCmkvVUJUcW5xd0tBS0ZaR1ZOUStk
dlNXL2pETnoxUDFDYjBnT1ZCVjFGY2NKRVZzZWFrVnVYNzQwdG9iQ2ovbnkNCjlMR0srVWZMMmlK
ZDlFd3Y1dlRJblMvdHBMRit6SnFSTFBxODZCcDdnTytHZTFieVFwbGhwT0NKa0wxRmZGb3ENCmx0
djZBZlZuZUtETzhwSlB3UEZSZ01ZMUpUQWdFZzVYYkhQSVFWczhURTJZSEUrT2g0YjJsNEg5K1hE
aU1iam4NCmNMNnZnTS9GWjJaWnh1QnBDMTFxOUx5K1RjQXh5ekdjd245N2hXSjRtUjdzR211MTUy
STkyQ25BYWF5NElaYkMNClFoSklTZEh0R0tnaDZoR1c0VGcveFdBbFlBcDRqWGJrUDA3clhYSTFr
bThhT3pPcVFmSy9EeCtQVG9tbjRHTmcNClpUd2dYWTVPd2E1WUQwOFlaa0pjeFRjNzdKeDVMeDdB
TVJZbSt6ZlpDK25WNlZoYU4vaDdYN0ZPTmdOTjRVelUNCmx1UUkwMVVBR3ROc25SUVFDZTdLSmxy
N3JoVzExRHBpdm51Y3BTWUtkRjIrQVpzdVE5Qi9NZkNkZzFEK2FPYmsNCll0V1EzTjNkOEFPa2ZC
ZHJKcjhLRGh4Qk44VFA4VksyOThzbnhsc0ZxbXVaV3l2VjhmK3YxWEVXQ2ZIa2M1MDgNCjhSUXRs
cU1mWU5Yd3RmY2E1Q01nLzh2Q1FBZU4zWFQ5TjhQNUhwVDZEcWszRTVtZzFrRmxaeVkvUlFPYWls
dVoNCjlabmxVMjQ9DQo9K01BVQ0KLS0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQ0K

--_003_7BA412A72CCB4EEE9E2D7EB07A6A3FA5amazoncom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_003_7BA412A72CCB4EEE9E2D7EB07A6A3FA5amazoncom_--


