Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHwnBmI8Dmqr9AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 00:57:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2259C6F5
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 00:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314551.1584524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPpVm-0007WI-1o; Wed, 20 May 2026 22:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314551.1584524; Wed, 20 May 2026 22:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPpVl-0007UO-VO; Wed, 20 May 2026 22:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1314551;
 Wed, 20 May 2026 22:35:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <prvs=593727dcc=dwmw@amazon.co.uk>)
 id 1wPpVk-0007UH-RN
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 22:35:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPpVj-005PJ7-WD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 00:35:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <prvs=593727dcc=dwmw@amazon.co.uk>)
 id 6a0e372c-2eae-0a2a0a5409dd-0a2a4504da88-2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 00:35:31 +0200
Received: from [34.197.10.50]
 (helo=iad-out-012.esa.us-east-1.outbound.mail-perimeter.amazon.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <prvs=593727dcc=dwmw@amazon.co.uk>)
 id 6a0e3732-1dec-0a2a45040019-22c50a327e5a-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 00:35:31 +0200
Received: from ip-10-4-10-75.ec2.internal (HELO
 smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.10.75])
 by internal-iad-out-012.esa.us-east-1.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:35:28 +0000
Received: from EX19MTAUEB002.ant.amazon.com [72.21.198.67:6519]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.39.92:2525]
 with esmtp (Farcaster)
 id 59278547-ce4e-45a1-a98f-79b6d9967b7c; Wed, 20 May 2026 22:35:27 +0000 (UTC)
Received: from EX19D001UEB003.ant.amazon.com (10.252.135.61) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 20 May 2026 22:35:27 +0000
Received: from EX19D001UEB002.ant.amazon.com (10.252.135.17) by
 EX19D001UEB003.ant.amazon.com (10.252.135.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 20 May 2026 22:35:26 +0000
Received: from EX19D001UEB002.ant.amazon.com ([fe80::19d6:e954:f18:6292]) by
 EX19D001UEB002.ant.amazon.com ([fe80::19d6:e954:f18:6292%3]) with mapi id
 15.02.2562.037; Wed, 20 May 2026 22:35:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=amazoncorp2 header.d=amazon.co.uk header.i="@amazon.co.uk" header.h="From:To:CC:Subject:Date:Message-ID:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1779316531; x=1810852531;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to;
  bh=gSw8rnwXQ0rhZeVx84L0W3uc6MkIiFaqVJq9n/+cEdc=;
  b=cy3GisuwUsm2T7ZS2T7Q3v6ch39Yhl50nK+mzouUTqbcwN4T56yoFTB1
   HQKgQ4BPu3I5/xHYTmbLTLjtb0xl8syM7WPMja0deETIrcSiFAROoIpxF
   R0VWbZ6MfKudgV4fqDM1sL3/WOSmbibYJLi5lnssviRvI9QuW3CkS7Ykd
   1vWuJtylvmcvUytYWiFnVhZxCpaQQSPnttfWFGcR+GVFl/ShrQlFx213/
   NMvnLiTtQeJCVrCM7tnE8iHEJp3Sm/jvH7jc3l9vjKGKQq7ZFs7dWh/d3
   0UweHNo2Y5IRg7X3zC3Vt3QWbu/dfXZH0PkzmW4wjIgDACLWzpZ0ogpxE
   Q==;
X-CSE-ConnectionGUID: 5Q/LMkrsSYKzZPZuKRMfEQ==
X-CSE-MsgGUID: BEOYDa+3QkGrhQBheknQYg==
X-Amazon-filename: smime.p7s
X-IronPort-AV: E=Sophos;i="6.23,245,1770595200"; 
   d="p7s'346?scan'346,208,346";a="18939673"
Content-Type: multipart/mixed; boundary="===============8743037896110918423=="
MIME-Version: 1.0
X-Farcaster-Flow-ID: 59278547-ce4e-45a1-a98f-79b6d9967b7c
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "tglx@kernel.org" <tglx@kernel.org>, "longli@microsoft.com"
	<longli@microsoft.com>, "luto@kernel.org" <luto@kernel.org>,
	"alexey.makhalov@broadcom.com" <alexey.makhalov@broadcom.com>,
	"jstultz@google.com" <jstultz@google.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "ajay.kaher@broadcom.com"
	<ajay.kaher@broadcom.com>, "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kys@microsoft.com"
	<kys@microsoft.com>, "decui@microsoft.com" <decui@microsoft.com>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>, "wei.liu@kernel.org"
	<wei.liu@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>,
	"jgross@suse.com" <jgross@suse.com>
CC: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mhklinux@outlook.com"
	<mhklinux@outlook.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "nikunj@amd.com" <nikunj@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "rick.p.edgecombe@intel.com"
	<rick.p.edgecombe@intel.com>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 18/41] x86/paravirt: Pass sched_clock save/restore
 helpers during registration
Thread-Topic: [PATCH v3 18/41] x86/paravirt: Pass sched_clock save/restore
 helpers during registration
Thread-Index: AQHc6Kj0fv5ul1kqCk6EoM3O36i5qw==
Date: Wed, 20 May 2026 22:35:26 +0000
Message-ID: <69226e77bcf1b93041f27843b6259921f226c0cc.camel@amazon.co.uk>
References: <20260515191942.1892718-1-seanjc@google.com>
	 <20260515191942.1892718-19-seanjc@google.com>
In-Reply-To: <20260515191942.1892718-19-seanjc@google.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.83.30]
MIME-Version: 1.0
X-purgate-ID: tlsNG-ebf023/1779316531-4396A3FF-151BF746/21/137
X-purgate-type: clean
X-purgate-size: 11302
X-Spamd-Result: default: False [5.92 / 15.00];
	BLACKLIST_DMARC(6.00)[amazon.co.uk:D:-];
	SIGNED_SMIME(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[amazon.co.uk : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[amazon.co.uk:s=amazoncorp2];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain,multipart/alternative];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:longli@microsoft.com,m:luto@kernel.org,m:alexey.makhalov@broadcom.com,m:jstultz@google.com,m:dave.hansen@linux.intel.com,m:ajay.kaher@broadcom.com,m:jan.kiszka@siemens.com,m:haiyangz@microsoft.com,m:kas@kernel.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:kys@microsoft.com,m:decui@microsoft.com,m:daniel.lezcano@kernel.org,m:wei.liu@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:linux-kernel@vger.kernel.org,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@linutronix.de,m:nikunj@amd.com,m:xen-devel@lists.xenproject.org,m:linux-hyperv@vger.kernel.org,m:vkuznets@redhat.com,m:rick.p.edgecombe@intel.com,m:virtualization@lists.linux.dev,m:sboyd@kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[oracle.com,lists.linux.dev,vger.kernel.org,outlook.com,amd.com,broadcom.com,linutronix.de,lists.xenproject.org,redhat.com,intel.com,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+,6:~];
	RCPT_COUNT_TWELVE(0.00)[34];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dwmw@amazon.co.uk,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[amazon.co.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw@amazon.co.uk,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amazon.co.uk:mid,amazon.co.uk:email]
X-Rspamd-Queue-Id: 76E2259C6F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============8743037896110918423==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/pkcs7-signature"; boundary="=-4SuH15PLIgNoHhsEZRux"

--=-4SuH15PLIgNoHhsEZRux
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> Pass in a PV clock's save/restore helpers when configuring sched_clock
> instead of relying on each PV clock to manually set the save/restore hook=
s.
> In addition to bringing sanity to the code, this will allow gracefully
> "rejecting" a PV sched_clock, e.g. when running as a CoCo guest that has
> access to a "secure" TSC.
>=20
> No functional change intended.
>=20
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Nice!

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

> --- a/arch/x86/xen/time.c
> +++ b/arch/x86/xen/time.c
> @@ -567,13 +567,12 @@ static void __init xen_init_time_common(void)
> =C2=A0{
> =C2=A0	xen_sched_clock_offset =3D xen_clocksource_read();
> =C2=A0	static_call_update(pv_steal_clock, xen_steal_clock);
> -	paravirt_set_sched_clock(xen_sched_clock);
> +
> =C2=A0	/*
> =C2=A0	 * Xen has paravirtualized suspend/resume and so doesn't use the c=
ommon
> =C2=A0	 * x86 sched_clock save/restore hooks.
> =C2=A0	 */
> -	x86_platform.save_sched_clock_state =3D NULL;
> -	x86_platform.restore_sched_clock_state =3D NULL;
> +	paravirt_set_sched_clock(xen_sched_clock, NULL, NULL);
> =C2=A0
> =C2=A0	tsc_register_calibration_routines(xen_tsc_khz, NULL);
> =C2=A0	x86_platform.get_wallclock =3D xen_get_wallclock;


Same deal here as with kvmclock, FWIW. If the TSC is viable, then it's
the better choice.=20

Especially now there's a significant chance that a "Xen guest" is
actually running under KVM. Xen never screwed its pvclock up quite as
much as KVM did :)

--=-4SuH15PLIgNoHhsEZRux
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkYw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhUwggT9oAMCAQICEFQru/eJkU7BxeS7T6sWKmYwDQYJKoZIhvcN
AQELBQAwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNV
BAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBS
U0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMjQxMjE1MDAw
MDAwWhcNMjYxMjE1MjM1OTU5WjAiMSAwHgYJKoZIhvcNAQkBFhFkd213QGFtYXpvbi5jby51azCC
AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANhjs6T4tJ0lcw4+6sawEn2FowmhunUBsnSV
ccB+aA7s3Zd9PZV46CU6phAlCWpKk1yFVcD1Rnc4ux17o4LbUgFXiKrORS0jiF/5Oa0rXG3FISG1
Xdjt8oPKIq+9Z1s2e7Ipi5WWj4AG/xlkH/YMMctL9O8CCRHSrhiChbE/gR57x9PAnt5aeZZ2YWza
GOOeceaZe+u6vHCHITRmknSAnAX/aNoNJNsQCGcfrE83y9iHmP8BFrSRZqajBKlKq8tyJd5FnSwP
H3kSUcQlHOwiIfCRFXP4rpXSZ7nKOEZr3SXH06ADY9gZtrSpwBbuzKWDPGWMRuRnz8ogj/Y6DeU4
2zB/ZAIi5b0BzWf4u0rBEQD5xtpOCxYHc2nXQaFSWu36kP1JaNqElE51OQ92EyVKfW3N6qZcKiBr
VijXY2EtR+/5W9ixRFnEs4nIeb94Sf92UMEeG9ew2yVvcYXXNPaicGnrkESNC19/a8YXxQEZfrmB
eAPT9viQJhn3O+sD4pP0Ss3SjVZc6EO7vfoP07bt2n9YE08XSPkxcyb1J/4t/+AskkKeYFBGdpjg
xd+iLFxjSwBytZuh3+7DuHUfg876WA44ieQDrhHSjuvuAZ1Wb8WUsrpzrcLoYjqFmb/bf6/yyoxl
t31mdgPC+FLc+Yu1BQwXC3JMbrvbFBVTtn5X2EKDAgMBAAGjggHQMIIBzDAfBgNVHSMEGDAWgBQJ
wPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUWvtA1XsSV8xjgfFQL/DUTNIbJu4wDgYDVR0P
AQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwQwUAYDVR0gBEkwRzA6
BgwrBgEEAbIxAQIBCgIwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly9zZWN0aWdvLmNvbS9TTUlNRUNQ
UzAJBgdngQwBBQEDMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2Vj
dGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUF
BwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xp
ZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDov
L29jc3Auc2VjdGlnby5jb20wHAYDVR0RBBUwE4ERZHdtd0BhbWF6b24uY28udWswDQYJKoZIhvcN
AQELBQADggEBAED6T+rfP2XPdLfHoCd5n1iGIcYauWfPHRdZN2Tw7a7NEXIkm2yZNizOSpp3NrMi
WOBN13XgqnYLsqdpxJhbjwKczKX50/qfhhkOHtrQ0GRkucybK447Aaul80cZT8T3WG9U9dhl3Ct/
MuyKBWQg3MYlbUT6u4kC9Pk8rd+cR14ttYRUWDKTS2BrL7e8jpNmtCoEakDkMY4MrpoMwM1f4ANV
qZ8cnDntwXq5ormZIksN2DqxsKLmrFyVAONhqSST72ImBfIVWhFRTCF9tTcI5wE/0Skl25FZmSsB
B2LUgecgK7MZyw9Do/b0sYS+8YmA/ujUCqNb0fPJBE/B9vBomhswggYVMIIE/aADAgECAhBUK7v3
iZFOwcXku0+rFipmMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTI0MTIxNTAwMDAwMFoXDTI2MTIxNTIzNTk1OVowIjEgMB4GCSqGSIb3DQEJ
ARYRZHdtd0BhbWF6b24uY28udWswggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYY7Ok
+LSdJXMOPurGsBJ9haMJobp1AbJ0lXHAfmgO7N2XfT2VeOglOqYQJQlqSpNchVXA9UZ3OLsde6OC
21IBV4iqzkUtI4hf+TmtK1xtxSEhtV3Y7fKDyiKvvWdbNnuyKYuVlo+ABv8ZZB/2DDHLS/TvAgkR
0q4YgoWxP4Eee8fTwJ7eWnmWdmFs2hjjnnHmmXvrurxwhyE0ZpJ0gJwF/2jaDSTbEAhnH6xPN8vY
h5j/ARa0kWamowSpSqvLciXeRZ0sDx95ElHEJRzsIiHwkRVz+K6V0me5yjhGa90lx9OgA2PYGba0
qcAW7sylgzxljEbkZ8/KII/2Og3lONswf2QCIuW9Ac1n+LtKwREA+cbaTgsWB3Np10GhUlrt+pD9
SWjahJROdTkPdhMlSn1tzeqmXCoga1Yo12NhLUfv+VvYsURZxLOJyHm/eEn/dlDBHhvXsNslb3GF
1zT2onBp65BEjQtff2vGF8UBGX65gXgD0/b4kCYZ9zvrA+KT9ErN0o1WXOhDu736D9O27dp/WBNP
F0j5MXMm9Sf+Lf/gLJJCnmBQRnaY4MXfoixcY0sAcrWbod/uw7h1H4PO+lgOOInkA64R0o7r7gGd
Vm/FlLK6c63C6GI6hZm/23+v8sqMZbd9ZnYDwvhS3PmLtQUMFwtyTG672xQVU7Z+V9hCgwIDAQAB
o4IB0DCCAcwwHwYDVR0jBBgwFoAUCcDy/AvalNtf/ivfqJlCz8ngrQAwHQYDVR0OBBYEFFr7QNV7
ElfMY4HxUC/w1EzSGybuMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoG
CCsGAQUFBwMEMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoCMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAzBaBgNVHR8EUzBRME+gTaBLhklodHRw
Oi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3Vy
ZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuc2Vj
dGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5j
cnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMBwGA1UdEQQVMBOBEWR3bXdA
YW1hem9uLmNvLnVrMA0GCSqGSIb3DQEBCwUAA4IBAQBA+k/q3z9lz3S3x6AneZ9YhiHGGrlnzx0X
WTdk8O2uzRFyJJtsmTYszkqadzazIljgTdd14Kp2C7KnacSYW48CnMyl+dP6n4YZDh7a0NBkZLnM
myuOOwGrpfNHGU/E91hvVPXYZdwrfzLsigVkINzGJW1E+ruJAvT5PK3fnEdeLbWEVFgyk0tgay+3
vI6TZrQqBGpA5DGODK6aDMDNX+ADVamfHJw57cF6uaK5mSJLDdg6sbCi5qxclQDjYakkk+9iJgXy
FVoRUUwhfbU3COcBP9EpJduRWZkrAQdi1IHnICuzGcsPQ6P29LGEvvGJgP7o1AqjW9HzyQRPwfbw
aJobMYIExDCCBMACAQEwgaswgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNo
ZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UE
AxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EC
EFQru/eJkU7BxeS7T6sWKmYwDQYJYIZIAWUDBAIBBQCgggHpMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDUyMDIyMzUyNVowLwYJKoZIhvcNAQkEMSIEIL2s+i5z
peY46Ptk9qjCSJOKEZrw5O7LYSh0B78gGztzMIG8BgkrBgEEAYI3EAQxga4wgaswgZYxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAW
BgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEFQru/eJkU7BxeS7T6sWKmYwgb4GCyqGSIb3
DQEJEAILMYGuoIGrMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhBUK7v3
iZFOwcXku0+rFipmMA0GCSqGSIb3DQEBAQUABIICADOnPyHOuAq054zVY9YGhJxO7Weim8TV3Mv+
IQQXLakRg9mUO3R9mM0OKP/yipEhYUKwntpnfxVh/+1WMRZG16pXRgiMmngl/rIF9T3nYrLua8sS
6yjLGeF1kbnViuPAhUMZaMCMVUY7TThYT5pY6eiWXhYgEpLIGtk+54n0w2HS5SF+ot86AOeZMzDW
OYCn8LLvkuAD5xCKSuMGRgcsdacZZ4g4iz02jzif5VnaDdeAtxZ9sRDAfOOBHHuI9unRkffcAl/S
XfxmARsV52J2VeyWh2J1Ef723VWayYNGZvmZbpJ4XEM9RzL0/GWeCY9ErMViUWXYCANRiT8PD/tf
u3K5vm5hGHCbW4G4KndzJ7Kqgs1lCHuNuucdl3OVszY9ntcWp/Am9t5XRaiJKhpQPh1UyuZ5ikOg
3sS4zu17fiBvtBemzQ/n+2HlLWpdVy9ggdJNprCOo1uXrkoIWouHtM7bhU90aEaVhEljpLl4HliU
wA++vIJ1qXSkeSeE8mR3OFNDHv1KDWE4y1RGdF2JoKeSKP9UFcfvo8KdnQSYq80KF31dgwLm5ZPf
CAzHt6ylFufRPkoca9fpNrkGj1dlLLBMImqcsiAe+FrD/XN5Zoyor6a08kvDIbvwH5RN32h7dVuA
f64X0LXa77752tE3HenWxcHB5Mj+da7CBds5/1x3AAAAAAAA


--=-4SuH15PLIgNoHhsEZRux--

--===============8743037896110918423==
Content-Type: multipart/alternative; boundary="===============2486592903892225233=="
MIME-Version: 1.0
Content-Disposition: inline

--===============2486592903892225233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Centre (London) Ltd. Registered in England and Wales wit=
h registration number 04543232 with its registered office at 1 Principal Pl=
ace, Worship Street, London EC2A 2FA, United Kingdom.



--===============2486592903892225233==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Centre (London) Ltd.Registered in England an=
d Wales with registration number 04543232 with its registered office at 1 P=
rincipal Place, Worship Street, London EC2A 2FA, United Kingdom.<br><br><br>

--===============2486592903892225233==--

--===============8743037896110918423==--

