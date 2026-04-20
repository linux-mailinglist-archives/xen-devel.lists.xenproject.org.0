Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECxrMDER5mlrrAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 13:42:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068342A001
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 13:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285690.1566806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEn1L-0004p4-Mh; Mon, 20 Apr 2026 11:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285690.1566806; Mon, 20 Apr 2026 11:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEn1L-0004mV-Jv; Mon, 20 Apr 2026 11:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1285690;
 Mon, 20 Apr 2026 11:42:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wEn1K-0004mP-Iw
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:42:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEn1J-00AhSH-Vm
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:42:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e6111b-bab6-0a2a0a5309dd-0a2a4501eaa0-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 13:42:29 +0200
Received: from [52.101.84.58]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e61124-c1f2-0a2a45010019-3465543a8d08-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 13:42:28 +0200
Received: from DU2PR04CA0191.eurprd04.prod.outlook.com (2603:10a6:10:28d::16)
 by PR3PR08MB5820.eurprd08.prod.outlook.com (2603:10a6:102:90::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 11:42:25 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::a4) by DU2PR04CA0191.outlook.office365.com
 (2603:10a6:10:28d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 11:42:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 11:42:25 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9847.eurprd08.prod.outlook.com (2603:10a6:10:444::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 11:41:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 11:41:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y0WCZwIjDzOJCvLPW8GoXR9fIbSi7eyqGNEbIdS9en6CdyHQIGbh1UQMO94U+MEl2C5+IdbLbLD3gdKY+aI7c/MA/9oCr8mLiP+Lwx8j1HzTEeOIP6nI2nqPOzUdUxQwGcsPfxXChlEvyGrKZyujIW6wPk/D+aJFGx94SCFrAh5BuoPefplaHwSaa4V36tQH61O3NK1wlzUFOAq8jgUWLgaFeZko9kNDJSpzeaC5FnDpnQImexoYcIS6bEwLDfqKpcaZMP0k/5Aat5XCfa4bjpSLeiAEYJbuoZJqUm11Yx4azl5hIQ6reVShlhva+ItcZUohktfRZFHpZlA6Uj61aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GivgOMtdmsOupdEf24L90Bwdbr214++lde9BKw9Fngs=;
 b=MOZmQhb3RmJep4wACttOXrf6i88lf1mw9dcvIGYjwCdWGks8+doH3TSZwvoJidJq44MhfE19UptHuxQgeFL8JWgNZIGdrVWfRor6wlIxwMn+lAS/Dac0bAM9bd7hp2H5OpBH0HOrBWN7fuZ3TKfLYtk1C/ig1lKj/T+N7XAyfwbSXHTTWBBoh729vQGXSmItwlMWuQo92FBjT/ranei0vsmqRfCD8BPG0ecO/w6ygTTF80dWiVlZIXb/pe4Jntr/kg2OmduY6de3iyHqn2ldFGv79DoLcu0Fei0ARdrHl3izCRJQx++ksp/jKO7x4DxfGotagl5aPFMQRQH9bT1c8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GivgOMtdmsOupdEf24L90Bwdbr214++lde9BKw9Fngs=;
 b=Ojqw1LWieqy58xuspFmR2OJhm/2q8/t5r10j9+hdTWd/1Q9s5xrTOpCV+CrUKEp1rQKTmojwjtXFU5rhq/+lZeDVUcB/dJEKykjy8P8u9vcLF3xKRWHwtDFrWp1CPgmYt++sm/XwdutV2+U2fCChUyplhDSkDKZa4xolANLO/2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVuQwUkipVfHPn4PXeVqZBGOOR24c+IuHMkYlYzti6Us6gOQFNr8xi3JOq4s30anz1jGZu6QRaVhvLP7GSTMtI6z1zjPq0OJAkvnwcIJdNsB1Ky3TTL41eaDxdEgnUGR9W3Ja8FtZXHhG7arJZ6g2Wmj1Oxfpm/1qZHqXV4c87dcgH64FKtcvL9Ku93awpD47G4iZCasSJV40Ow8VzTLwjt6QpH1GZurXehAE/51f9szbmKDNmncb2mH5YI7GxsjeQ7W5UuadhPKQEw4Q89scs12KZflTrTDTqnu0Q1USKMuHmmys0ORnPljt0/M3OpcoKiAAhr97Btcx8dzwcKBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GivgOMtdmsOupdEf24L90Bwdbr214++lde9BKw9Fngs=;
 b=mTNzHrAm7F3ak6t8iLDCtL6KoiM/dzXiJCva11hgui3zEU2Hk7r8gehemviJcmJRQa/cGraa38sCCc/vt0meESz31QvdlZ4dzTaij1W6BWbVrA9B/fXgyReBJoKwT3ohB0i8IW95M14yiEpbsIa6matdAVl1ztjjuacaex4dkP3KZCJedhfaeIl7MpN80AKzXAUFyDK5bbyh69WvPu/9MYe0MFHIHieAjEBn2e+HoLgMxVQUZSbUUX5yY5vLIsM0rQr2IYGuaWbl1tig9Yl2EFeWvIloX0B1+lcuT1nrtlJUFJvkFhcaxEtb+KQ+KK59Edzy+g7ST14XBS8PLzFmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GivgOMtdmsOupdEf24L90Bwdbr214++lde9BKw9Fngs=;
 b=Ojqw1LWieqy58xuspFmR2OJhm/2q8/t5r10j9+hdTWd/1Q9s5xrTOpCV+CrUKEp1rQKTmojwjtXFU5rhq/+lZeDVUcB/dJEKykjy8P8u9vcLF3xKRWHwtDFrWp1CPgmYt++sm/XwdutV2+U2fCChUyplhDSkDKZa4xolANLO/2k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
Thread-Topic: [PATCH] xen/arm: gic-v2: disable interrupt bypass on CPU
 shutdown
Thread-Index: AQHcyM3ZwfiMQ0fViEyMjacB3wgBCLXn43iA
Date: Mon, 20 Apr 2026 11:41:21 +0000
Message-ID: <1E7985CB-EE4C-4769-B23C-EDEF2E75EF08@arm.com>
References:
 <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
In-Reply-To:
 <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9847:EE_|DB1PEPF000509E4:EE_|PR3PR08MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e58886c-1b13-420e-a8ad-08de9ed1e47f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 D4EK043H8NsbFOn8IHr5ln9hdhX4Fgd5xpRrXfBXmrd6oJemj6P4pxGqi9lyNOR7jrI17p14PlVzi3RfADfIU9I/KYgBljcnPSfzK6jDtYTikgFYrsn5LEtebQLiN0I/gw9SqQLfZH9js+mK0yuRlwRTh/7atR6vtN7ECtnrL6deCZPEdkj+89bx/QscA8NSXaQG1C94qwU+VKo8S1p3Q0h0gisFZM6TqvTXhi/dJU9C4/xquihnfdfM4vSWBYb9wKFSvqgGrwBrDPL9iDICRglNC0ClVNdiNKiymxGp7G1PA7yZair99B03pM6Bs4WIdG0TlGwQb0vrplRjUE2uy+jTd0E0B7hYThH1wLqbckQC6Fs+I0aJ6PPeVi2opj8P7dvr89ZsGg8aSlbnV8z9nlPDhH7fCSFRIDjlJFrlrgDsa5WFhwR4t2TqogR60unQsfKbRU0uTJpTmB6S+Vq5C3aAAu4KNFON5pY1GTahOK//kC/MnSpZWpN6GIDWf/gJc/2ChWdH0oUWB0rwZoPRr3hRkDOZ0REBPTNyufWed6ZHM2rnLZqxdVulWXjceuPSX4Q7oGHxSKQX3tBlYyTHS91UVvgV1m8SqWltAkfB+aYzyX2fhb0+cJoPasQSBGrkg8Tp1q0l1ZjyqngCqWo9vuCAEViHJLPfQEgc5mekLmE7haCUh/l7tAEu5Vms87OcRs4cpdqTTnXNn3OexnT1bKsT2vDltdJe8wv9HxjRiF0PmFbOw4gjrm6RAVDmqX7wToMJoaIQpJBXn+pOiEJAKbKQsN3pdHEOXUV0BKteoWA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4EF891A8CA7AAE4F9F08AE4EEFA530EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uu/44UGnvrO6mZ/xyPB8uRjQQj09s5O1ljb5/FncsJBEj6VY4FK0WmvVfg6KpyyO1zM+p1f/SYfxPt8jjygDsaFeLfQWKgA+lu60yOt41yYXrFCd3Jvsy8YPl9fPsBXdFFrKT4d1lJPWWwI5ETyKlc+RbrtDaNHV5bgKKWWaVg7W1Z2j5P3QINhLmqHRbQ9MwQ1ZyvIIPB1z6SXdgmU7WBX2C7oootJrUBWRpNP8kFq/ubMIHFefXXOrzN8J/2ngTL14gbEhcTCHI/qIF57Raj9t0UK8j6WJ/P7W347hFj++ggkAM17/tUsrOU5WTioWCq9TxdCzrlREbIYdHUHZeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9847
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	33d8b3d9-6db3-43de-ff66-08de9ed1be6d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kYwQmP24E5+zHZLCwK+RHdecQgWmXHp82PWThB24aCRHdxXpM25jxFqzifmIZQiOJSSIYupPKdI+R/a0/IByjcT0YCZF2NEe/yHLurxXXoeVBqm7h2e2UXUNsD3j9atMFmYOL7/HMSyQlBLkcb99KsxAu3qHjUCX83v/eoFpMz4NRvnYq/W0iAUzV69oYblU2HMg5cLDesW2Uh91cH0B4NztJE1DbmLHHSMir5vZZafZqyJ8S0SJgiDR0GcPvQj/jFLW5O1I36sFI0J/8m6WM424O4lwZEiB96Kd2vegVuCwC3ABx55lNcyQYXKeSJYBh3fXHVxdmEu7CEFiAybh5FgIevVp1a6O7lBdBHMFAgyzOe5OeFgO546XZwHKeJoThKJjHY0WZX8jVONmwkMT/T2F3VAyxiCw3lRrHKRfvKKPPDaOa2mbXocHgVn0TwIyrgXJGxuVu7y83ePgJgB4A4quIUf3HQCxLWB6lmOI4oioTAWlw9tsmTWscoF9iW4OQqSJjWgc11RGylNs6a4uCN2pMN3blnnOKjIHocjeSgnpKCzVdPqziPLY0+2jQyCpzQr/Rnf+6Hj6R4RtEiPw6cPv8GoYziybCXiFWpWDzD0e31l/tc1/z4+XHxy2uGJLHsCAiAMNZ0MFsYXf55I2L73+4mF0Ex1YcFQyqwY6uuRK91TOEC6pg0om/YEXiYzSGwUejFKt2arEZrxkim93G6AH7ar3813GVhC+HKRRVs4pUvCGhBuHEjihSjtp+fQ49EK1qWr+wOxZQhK9lhVYzw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aDP/8KXiK6xoPbSBCmUXBY1HcKCiWJTbA0b7kJeItmMG8PWKO/oXltgLD/Cm0yqdedatLHYGgkzij3SSzdmzrLhJSKtDsbZACl/BEcAB4poxPKDfNgEceR7oeDNgIdtAlrog2UK4S1oEfFFu2oF4X0Hya/9Pr/2i/JvngnvNuOn87qiBl3MVmK+oAmxmOft8lUejH7Sgdru1rc+znsZzL4/4qJ5+YbR1m8ao7fEXYlWXvL+/bsUBarzOzHzn1OLT9utpQZEFPANydvG13qZBOlVO/Bvs9vb6PSAm3GRgJVMVxNy95Oi8EeOEQi8I754EQN4R26ZuziVtGpym09QIndbwkD7VfA8g/AOo9WxvkbNM5Bnr9TzhGX4e+bEBq9FE81XuZiODvYSmc7X/jck4guZ1UoP78fqvJa/HwsceFr/4KXNJbOFSstbcF8Vfjhwf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 11:42:25.0950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e58886c-1b13-420e-a8ad-08de9ed1e47f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5820
X-purgate-ID: tlsNG-d62444/1776685349-B5A69FF4-924316F3/0/0
X-purgate-type: clean
X-purgate-size: 1916
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[arm.com:server fail,epam.com:server fail,lists.xenproject.org:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid,epam.com:email]
X-Rspamd-Queue-Id: 3068342A001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 10 Apr 2026, at 10:36, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
>=20
> Per IHI0048B.b section 2.3.1, clearing IRQBypDisGrp{0,1} and
> FIQBypDisGrp{0,1} selects bypass rather than deasserted interrupt
> outputs when the CPU interface stops driving them. Tables 2-2 and 2-3
> show that a zeroed GICC_CTLR can fall back to the legacy IRQ/FIQ inputs
> instead of fully disabling the interface.
>=20
> Fix this by reading GICC_CTLR, setting the bypass-disable bits, and
> clearing both group-enable bits before writing the value back. Keep the
> existing GICC_CTL_ENABLE definition for the init path and use a separate
> mask for the shutdown-side group-enable handling.
>=20
> Section 2.3.2 also states that wakeup event signals remain available
> even when both GIC interrupt signaling and interrupt bypass are
> disabled, so disabling bypass does not break the power-management use
> case, i.e. suspend modes.
>=20
> Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> xen/arch/arm/gic-v2.c          |  7 ++++++-
> xen/arch/arm/include/asm/gic.h | 21 +++++++++++++++++++--
> 2 files changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..22aa25bad0 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -408,7 +408,12 @@ static void gicv2_cpu_init(void)
>=20
> static void gicv2_cpu_disable(void)
> {
> -    writel_gicc(0x0, GICC_CTLR);
> +    uint32_t ctlr =3D readl_gicc(GICC_CTLR);
> +
> +    ctlr |=3D GICC_CTL_BYP_DIS_MASK;

If the GIC v2 implementation includes the Security Extensions, the bit 7-8
are reserved, but now we are unconditionally writing on them.

Cheers,
Luca


